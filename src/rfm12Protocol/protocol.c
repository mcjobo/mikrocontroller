/*
 * protocol.c
 *
 * Created: 28.10.2013 20:37:45
 *  Author: jbolay
 */ 

#include "rfm12Protocol.h"
#include "rfm12.h"

// states
void stateIdle();
void stateSendData();
void stateWaitForAck();
void stateResend();
void stateTimeout();
void stateReceiveData();
void stateSendNack();
void stateSendAck();

//support functions



volatile void (*statefunc)() = stateIdle;
uint8_t resultCheckData = 0;
uint8_t timeoutCounter = 0;
volatile uint8_t tick = 0;

//support functions

/************************************************************************/
/* timer functions used for a timeout while waiting for ack of a transmission */
/************************************************************************/
ISR (TIMER0_COMPA_vect)
{
	++tick;
	if(tick >= 150){
		tick = 0;
		stopTimer();
		statefunc = stateTimeout;
	}
}

void stopTimer(){
	TIMSK0 &= ~(1<<OCIE0A);
}

void startTimer(){
	TCCR0A = (1<<WGM01); // CTC Modus
	TCCR0B |= (1<<CS02)|(1<<CS00); // Prescaler 1024
	OCR0A = 48-1;
	
	// Compare Interrupt erlauben
	TIMSK0 |= (1<<OCIE0A);
	
	// Global Interrupts aktivieren
	sei();
}

/************************************************************************/
/* used to encode the packet header into the data						*/
/* creates and appends the crc 
/* returns a pointer to the created data                                */
/************************************************************************/
uint8_t* encode(uint8_t length, uint8_t ack, uint8_t type, uint8_t address, uint8_t* data){
	uint8_t newData[length + OVERHEAD];
	

	newData[0] = ((getProtocolVersion()<<3) | (ack & 0x07));
	newData[1] = type;
	newData[2] = address;
	for(int i = 0; i < length; ++i){
		newData[i + 3] = data[i];
	}
	uint16_t crc = createCrc(length + 3, newData);
	newData[length +3] = crc>>8;
	newData[length +4] = crc & 0x00ff;
	return newData;
}

/************************************************************************/
/* used to create a 16bit crc from the data stream 
/* returns the 16bit crc                                                */
/************************************************************************/
uint16_t createCrc(uint8_t length, uint8_t* data){
	uint16_t crc = 0;
	#if CRC_UART_DEBUG >= 3
	uart_putc('§');
	#endif
	for (uint8_t i = 0; i < length; i++){
		crc = _crc_ccitt_update(crc, data[i]);
		#if CRC_UART_DEBUG >= 3
		uart_putc(data[i]);
		#endif
	}
	
	#if CRC_UART_DEBUG >= 3
	char buf[3];
	uart_putc('§');
	uart_putc(itoa(crc>>8, buf, 16);
	uart_putc(itoa(crc&0x00ff, buf, 16);
	uart_putc('§');
	#endif
	return crc;
}

/************************************************************************/
/* checks if the given crc is the same as created from the data stream
/* returns 0 if wrong 1 if crc ok                                       */
/************************************************************************/
uint8_t checkCrc(uint8_t length, uint8_t* data, uint16_t crc){
	uint16_t newCrc = createCrc(length, data);
	#if CRC_UART_DEBUG >= 1
		char buf[3];
		uart_putc('@');
		uart_putc(itoa(newCrc>>8, buf, 16));
		uart_putc(itoa(newCrc&0x00ff, buf, 16));
		uart_putc('@');
		uart_putc(itoa(crc>>8, buf, 16));
		uart_putc(itoa(crc&0x00ff, buf, 16));
		uart_putc('@');
	#endif
	if(newCrc == crc){
		return 1;
	}
	return 0;
}

/************************************************************************/
/* trying to validate if the crc of the data stream is correct
/* returns 0 if not ok returns 1 if ok                                  */
/************************************************************************/
uint8_t validateCrc(uint8_t length, uint8_t* data){
	uint16_t crc = (data[length-1])|(data[length-2]<<8);
	uint8_t ack = checkCrc(length-2, data, crc);
	if(ack){
		return 1;
	}
	return 0;
}
/************************************************************************/
/* returns the length of the payload only                               */
/************************************************************************/
uint8_t getPayloadLength(uint8_t length, uint8_t* data){
	return length - OVERHEAD;
}

/************************************************************************/
/* returns the protocol version of the data stream                      */
/************************************************************************/
uint8_t getVersion(uint8_t length, uint8_t* data){
	uint8_t byte = data[0];
	byte = byte & 0xf8;
	byte = byte>>3;
	return byte;
}

/************************************************************************/
/* returns the ack bits                                                 */
/************************************************************************/
uint8_t getAck(uint8_t length, uint8_t* data){
	uint8_t byte = data[0];
	byte = byte & 0x07;
	return byte;
}

/************************************************************************/
/* returns the type byte from the data stream                           */
/************************************************************************/
uint8_t getType(uint8_t length, uint8_t* data){
	uint8_t byte = data[1];
	return byte;
}

/************************************************************************/
/* returns the data byte from the data stream                           */
/************************************************************************/
uint8_t getAddress(uint8_t length, uint8_t* data){
	uint8_t byte = data[2];
	return byte;
}

/************************************************************************/
/* returns a pointer to the payload stream                              */
/************************************************************************/
uint8_t* getPayload(uint8_t length, uint8_t* data){
	return data+3;
}

/************************************************************************/
/* returns the 16bit crc from the data stream                           */
/************************************************************************/
uint16_t getCrc(uint8_t length, uint8_t* data){
	uint16_t crc = (data[length-2]);
	crc = crc<<8;
	crc = crc | (data[length-1]);
	return crc;
}

/************************************************************************/
/* function to check for data received and copy the data to the received buffer 
/* returns 0 if no data was received and 1 if data was received and copied to receivebuffer*/
/************************************************************************/
uint8_t receiveCopyData(){
	if (rfm12_rx_status() == STATUS_COMPLETE){
		receiveBuffer.bufferLength = rfm12_rx_len();
		receiveBuffer.ackState = getAck(rfm12_rx_len(), rfm12_rx_buffer());
		receiveBuffer.type = getType(rfm12_rx_len(), rfm12_rx_buffer());
		receiveBuffer.address = getAddress(rfm12_rx_len(), rfm12_rx_buffer());
		memcpy(receiveBuffer.buffer, rfm12_rx_buffer(), rfm12_rx_len());
		rfm12_rx_clear();
		return 1;
	}
	return 0;
}

/************************************************************************/
/* function sends a nack packet to the sender given in the data         */
/************************************************************************/
void sendNack(bufferStruct buffer){
	rfm12_tx (OVERHEAD, encode(NO_ACK, NACK, getAddress(buffer.bufferLength, buffer.buffer), 0, 0x00));
}

/************************************************************************/
/* function sends a ack packet to the sender given in the data          */
/************************************************************************/
void sendAck(bufferStruct buffer){
	rfm12_tx (OVERHEAD, encode(ACK, NO_DATA, getAddress(buffer.bufferLength, buffer.buffer), 0, 0x00));
}

/************************************************************************/
/* checks if the receiving data has the correct version
/* and the correct address
/* returns 0 if either is false return 1 if both is ok                  */
/************************************************************************/
uint8_t checkVersionAddress(){
	if(getVersion(receiveBuffer.bufferLength, receiveBuffer.buffer) != getProtocolVersion()){
		receiveBuffer.bufferLength = 0;
		return 0;
	}
	if(getAddress(receiveBuffer.bufferLength, receiveBuffer.buffer) != nodeAddress){
		receiveBuffer.bufferLength = 0;
		return 0;
	}
	return 1;
}

/************************************************************************/
/* state functions                                                      */
/************************************************************************/
void stateIdle(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("idle\r\n");
	#endif
	if(receiveCopyData()){
		statefunc = stateReceiveData;
		return;
	}
	if(sendBuffer.bufferLength > 0){
		statefunc = stateSendData;
		return;
	}
}

void stateSendData(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("sendData\r\n");
	#endif
	
	uint8_t ret = rfm12_tx (sendBuffer.bufferLength+OVERHEAD, encode(sendBuffer.ackState, sendBuffer.type, sendBuffer.address, sendBuffer.bufferLength, sendBuffer.buffer));
	if(sendBuffer.ackState & NEED_ACK){
		statefunc = stateWaitForAck;
	} else {
		sendBuffer.bufferLength = 0;
		statefunc = stateIdle;
	}
}

void stateWaitForAck(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("waitForAck\r\n");
	#endif
	
	// starts the timeout timer that triggers resend or after 5 retries abort
	startTimer();
	
	// check if we can decode the received data 
	if (receiveCopyData()){
		if(!checkVersionAddress){
			statefunc = stateWaitForAck;
			return;
		}
		if(!validateCrc(receiveBuffer.bufferLength, receiveBuffer.buffer)){
			stopTimer();
			statefunc = stateResend;
			return;
		} else {
			if(getAck(receiveBuffer.bufferLength, receiveBuffer.buffer) & ACK){
				memcpy(receiveBuffer.buffer, getPayload(receiveBuffer.bufferLength, receiveBuffer.buffer),getPayloadLength(receiveBuffer.bufferLength, receiveBuffer.buffer));
				receiveBuffer.bufferLength = getPayloadLength(receiveBuffer.bufferLength, receiveBuffer.buffer);
				statefunc = stateIdle;
				resultCheckData = 1;
				stopTimer();
				sendBuffer.bufferLength = 0;
				return;
			}
		}
	}
	statefunc = stateWaitForAck;		
}


void stateResend(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("resend\r\n");
	#endif
	
	statefunc = stateSendData;
}

void stateTimeout(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("timeout\r\n");
	#endif
	
	if(timeoutCounter >= 5){
		#if STATE_UART_DEBUG >= 1
			uart_putstr ("5x timeout\r\n");
		#endif
		sendBuffer.bufferLength = 0;
		statefunc = stateIdle;
		timeoutCounter = 0;
		return;
	}
	statefunc = stateResend;
	++timeoutCounter;
	return;
}

void stateReceiveData(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("receiveData\r\n");
	#endif
	
	if(!checkVersionAddress){
		statefunc = stateIdle;
		return;
	}
	if(!validateCrc(receiveBuffer.bufferLength, receiveBuffer.buffer)){
		statefunc = stateSendNack;
		return;
	} else {
		memcpy(receiveBuffer.buffer, getPayload(receiveBuffer.bufferLength, receiveBuffer.buffer),getPayloadLength(receiveBuffer.bufferLength, receiveBuffer.buffer));
		receiveBuffer.bufferLength = getPayloadLength(receiveBuffer.bufferLength, receiveBuffer.buffer);
		if(receiveBuffer.ackState & NEED_ACK){
			statefunc = stateSendAck;
			return;
		}
		statefunc = stateIdle;
		resultCheckData = 1;
		return;
	}
}

void stateSendNack(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("sendNack\r\n");
	#endif
	
	sendNack(receiveBuffer);
	statefunc = stateIdle;
}

void stateSendAck(){
	#if STATE_UART_DEBUG >= 1
		uart_putstr ("sendAck\r\n");
	#endif
	
	sendAck(receiveBuffer);
	statefunc = stateIdle;
}

/************************************************************************/
/* check data funktion return 0 if nothing 1 if data receivec			*/
/* call regulary 
/* return a 0 if no data arrived returns a 1 if data arrived            */
/************************************************************************/
uint8_t checkData(){
	rfm12_tick();  //periodic tick function - call that one once in a while
	resultCheckData = 0;
	
	(*statefunc)();
	
	return resultCheckData;
}

/************************************************************************/
/* inits the communication with the rfm12 module                        */
/************************************************************************/
void initCommunication(){
	sei();
	rfm12_init();  // initialize the library
	rfm12_rx_clear();
}

/************************************************************************/
/* functions to copy data into the send buffer
/* returns < 0 if enque ok 0                                            */
/************************************************************************/
uint8_t transmitData(bufferStruct sendData){
	if(sendBuffer.bufferLength > 0){
		return -1;
	}
	sendBuffer.ackState = sendData.ackState;
	sendBuffer.address = sendData.address;
	sendBuffer.bufferLength = sendData.bufferLength;
	sendBuffer.type = sendData.type;
	memcpy(sendBuffer.buffer, sendData.buffer, sendData.bufferLength);
	return 0;
}

