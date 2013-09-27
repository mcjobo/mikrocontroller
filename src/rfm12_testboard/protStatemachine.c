/*
 * protStatemachine.c
 *
 * Created: 23.09.2013 15:53:51
 *  Author: jbolay
 */ 
#include "protStatemachine.h"
#include "rfm12.h"
#include "protocol.h"

uint8_t expectAck = 0;
bufferStruct backupData;
uint8_t backupType;

void initCommunication(){
	rfm12_init();  // initialize the library
	sei();
}

void processAck(){
	expectAck = 0;
}	

void processNack(){
	expectAck = 1;
	sendData(backupData, backupType);
}	
	
bufferStruct receiveSendData(bufferStruct buffer){
	bufferStruct result;
	if(getType(buffer.bufferLength, buffer.buffer) & NEED_ACK > 0){
		sendAck(buffer);
	}
	result.bufferLength = getPayloadLength(buffer.bufferLength, buffer.buffer);
	memcpy(result.buffer, getPayload(buffer.bufferLength, buffer.buffer), result.bufferLength);
	return result;
}

void checkReceiveData(bufferStruct buffer){
	if (rfm12_rx_status() == STATUS_COMPLETE)
	{
		uint8_t i;
		uart_putstr ("new packet:\r\n");

		buffer.bufferLength = rfm12_rx_len();
		memcpy(buffer.buffer, rfm12_rx_buffer(), buffer.bufferLength);
		
		if(validateCrc(buffer)){
			uart_putstr ("ack\r\n");
		} else {
			uart_putstr ("nack\r\n");
			rfm12_rx_clear();
			//sendNack(buffer)
			return;
		}

		if(expectAck){
			switch(getType(buffer.bufferLength, buffer.buffer)){
				case ACK:
					processAck();
					break;
				case NACK:
					processNack();
					break;
			}
		}		
		if(!expectAck){
			switch(getType(buffer.bufferLength, buffer.buffer)){
				case SEND_DATA:
					return receiveSendData(buffer);
					break;
			// here we should implement the cases of repeating data therefore we would have to know all last data sent
			// here we should implement the get back to in -> timeframe not yet implemented		
			}
		}	
		

		// dump buffer contents to uart
		uint8_t* payload = getPayload(buffer.bufferLength, buffer.buffer);
		for (i=0;i<getPayloadLength(buffer.bufferLength, buffer.buffer);i++)
		{
			uart_putc ( payload[i] );
		}
		uart_putstr ("\r\n");
		
		
		
		// tell the implementation that the buffer
		// can be reused for the next data.
		rfm12_rx_clear();
	}
}

void sendData(bufferStruct buffer, uint8_t ack){
	backupData = buffer;
	rfm12_tx (buffer.bufferLength+OVERHEAD, encode(ack, SEND_DATA, 0x05, buffer.bufferLength, buffer.buffer));
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
	rfm12_tx (OVERHEAD, encode(NO_ACK, NACK, getAddress(buffer.bufferLength, buffer.buffer), 0, 0x00));
}

void sendAck(bufferStruct buffer){
	rfm12_tx (OVERHEAD, encode(NO_ACK, ACK, getAddress(buffer.bufferLength, buffer.buffer), 0, 0x00));
}