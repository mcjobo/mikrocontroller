/*
 * protStatemachine.h
 *
 * Created: 23.09.2013 15:53:41
 *  Author: jbolay
 */ 


#ifndef PROTSTATEMACHINE_H_
#define PROTSTATEMACHINE_H_

#include <avr/io.h>

// states of the statemachine in witch the data transmission is in
#define STATE_FREE			0x00
#define STATE_EXPECKT_ACK	0x01
#define STATE_TIMEOUT		0x02
#define STATE_SENDING_ACK	0x03
#define STATE_SENDING_DATA	0x04

#define STATE_UART_DEBUG	5


// struct to hold the datastream and the length of it
typedef struct{
	uint8_t bufferLength;
	uint8_t buffer[30];	
} bufferStruct; 

extern volatile uint8_t state;

// public functions
void initCommunication();
bufferStruct checkReceiveData(bufferStruct buffer);
void sendData(bufferStruct buffer, uint8_t ack);

// internal functions don't use externaly
uint8_t validateCrc(bufferStruct buffer);
void sendNack(bufferStruct buffer);
void sendAck(bufferStruct buffer);
void processAck();
void processNack();
bufferStruct receiveSendData(bufferStruct buffer);
void startTimer();
void stopTimer();

#endif /* PROTSTATEMACHINE_H_ */