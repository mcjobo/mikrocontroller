/*
 * protStatemachine.c
 *
 * Created: 23.09.2013 15:53:51
 *  Author: jbolay
 */ 
#include "protStatemachine.h"
#include "rfm12.h"
#include "protocol.h"

volatile uint8_t state = 0;
volatile uint8_t tick = 0;
bufferStruct backupData;
uint8_t backupType;
uint8_t timoutCounter = 0;


void initCommunication(){
	rfm12_init();  // initialize the library
	sei();
	rfm12_rx_clear();
}

void processAck(){
	state = STATE_FREE;
	stopTimer();
	timoutCounter = 0;
}	

void processNack(){
	state = STATE_EXPECKT_ACK;
	sendData(backupData, backupType);
}	
	
bufferStruct receiveSendData(bufferStruct buffer){
	bufferStruct result;
	if(getAck(buffer.bufferLength, buffer.buffer) & NEED_ACK > 0){
		#if STATE_UART_DEBUG >= 2
			uart_putstr ("seAck\r\n");
		#endif
		state = STATE_SENDING_ACK;
		
		backupData.bufferLength = buffer.bufferLength;
		memcpy(backupData.buffer, buffer.buffer, buffer.bufferLength);
		
		sendAck(buffer);
	} else {
		result.bufferLength = getPayloadLength(buffer.bufferLength, buffer.buffer);
		memcpy(result.buffer, getPayload(buffer.bufferLength, buffer.buffer), result.bufferLength);
		
		#if STATE_UART_DEBUG >= 3
		uart_putc('%');
		uart_putc(result.bufferLength);
		uart_putc('%');
		for(uint8_t i = 0; i < result.bufferLength; ++i){
			uart_putc(result.buffer[i]);
		}
		uart_putc('%');
		#endif
	}	
	return result;
}

bufferStruct checkReceiveData(bufferStruct buffer){
	rfm12_tick();  //periodic tick function - call that one once in a while
	switch(state){
		case STATE_TIMEOUT:
			#if STATE_UART_DEBUG >= 2
				uart_putstr ("tiOu\r\n");
			#endif
			++timoutCounter;
			if(timoutCounter > 5){
				#if STATE_UART_DEBUG >= 2
					uart_putstr ("tiOuOverl\r\n");
				#endif
				state = STATE_FREE;
				stopTimer();
				timoutCounter = 0;
			} else {
				processNack();
			}			
			break;
		case STATE_SENDING_ACK:
			if(rfm12_tx_status() == STATUS_FREE){
				state = STATE_SENDING_DATA;
				#if STATE_UART_DEBUG >= 2
					uart_putstr ("finSeAck\r\n");
				#endif
				
				bufferStruct result;
				result.bufferLength = getPayloadLength(backupData.bufferLength, backupData.buffer);
				memcpy(result.buffer, getPayload(backupData.bufferLength, backupData.buffer), result.bufferLength);
				
				uart_putc('%');
				uart_putc(result.bufferLength);
				uart_putc('%');
				for(uint8_t i = 0; i < result.bufferLength; ++i){
					uart_putc(result.buffer[i]);
				}
				uart_putc('%');
				
				return result;
			}
		case STATE_SENDING_DATA:
			if(rfm12_tx_status() == STATUS_FREE){
				#if STATE_UART_DEBUG >= 2
					uart_putstr ("finSeData\r\n");
				#endif
				state = STATE_FREE;
			}				
			
	}
//uart_putstr (rfm12_rx_status());
	if (rfm12_rx_status() == STATUS_COMPLETE){
	
		bufferStruct tempBuffer;
		tempBuffer.bufferLength = rfm12_rx_len();
		memcpy(tempBuffer.buffer, rfm12_rx_buffer(), tempBuffer.bufferLength);
		
		if(validateCrc(tempBuffer)){
			#if STATE_UART_DEBUG >= 2
				uart_putstr ("crcAck\r\n");
			#endif
		} else {
			#if STATE_UART_DEBUG >= 2
				uart_putstr ("crcNack\r\n");
			#endif
			rfm12_rx_clear();
			sendNack(tempBuffer);
			return buffer;
		}

		if(state > STATE_FREE){
			if(getAck(tempBuffer.bufferLength, tempBuffer.buffer) & ACK){
				#if STATE_UART_DEBUG >= 2
				uart_putstr ("rxAck\r\n");
				#endif
				processAck();
			} else if(getType(tempBuffer.bufferLength, tempBuffer.buffer) & NACK){
				#if STATE_UART_DEBUG >= 2
				uart_putstr ("rxNack\r\n");
				#endif
				processNack();

			}				
		}		
		if(state == STATE_FREE){
			switch(getType(tempBuffer.bufferLength, tempBuffer.buffer)){
				case SEND_DATA:
					#if STATE_UART_DEBUG >= 2
						uart_putstr ("send\r\n");
					#endif
					buffer = receiveSendData(tempBuffer);
					break;
			// here we should implement the cases of repeating data therefore we would have to know all last data sent
			// here we should implement the get back to in -> timeframe not yet implemented		
			}
		}	
		// tell the implementation that the buffer
		// can be reused for the next data.
		rfm12_rx_clear();
	}
	return buffer;
}

void sendData(bufferStruct buffer, uint8_t ack){
	#if STATE_UART_DEBUG >=2
		uart_putstr("seData\r\n");
	#endif
	
	state = STATE_SENDING_DATA;
	memcpy(backupData.buffer, buffer.buffer, buffer.bufferLength);
	backupData.bufferLength = buffer.bufferLength;
	backupType = ack;
	rfm12_tx (buffer.bufferLength+OVERHEAD, encode(ack, SEND_DATA, 0x05, buffer.bufferLength, buffer.buffer));
	if(ack & NEED_ACK){
		#if STATE_UART_DEBUG >=2
			uart_putstr("expAck\r\n");
		#endif
		state = STATE_EXPECKT_ACK;
		startTimer();
	}
}

uint8_t validateCrc(bufferStruct buffer){
	uint16_t crc = (buffer.buffer[buffer.bufferLength-1])|(buffer.buffer[buffer.bufferLength-2]<<8);
	uint8_t ack = checkCrc(buffer.bufferLength-2, buffer.buffer, crc);
	if(ack){
		return 1;
	} 
	return 0;
}

void sendNack(bufferStruct buffer){
	state = STATE_SENDING_DATA;
	rfm12_tx (OVERHEAD, encode(NO_ACK, NACK, getAddress(buffer.bufferLength, buffer.buffer), 0, 0x00));
}

void sendAck(bufferStruct buffer){
	rfm12_tx (OVERHEAD, encode(ACK, NO_DATA, getAddress(buffer.bufferLength, buffer.buffer), 0, 0x00));
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

ISR (TIMER0_COMPA_vect)
{
	++tick;
	if(tick >= 150){
		state = STATE_TIMEOUT;
		tick = 0;
	}
}