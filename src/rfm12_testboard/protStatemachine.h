/*
 * protStatemachine.h
 *
 * Created: 23.09.2013 15:53:41
 *  Author: jbolay
 */ 


#ifndef PROTSTATEMACHINE_H_
#define PROTSTATEMACHINE_H_

#include <avr/io.h>


// struct to hold the datastream and the length of it
typedef struct{
uint8_t bufferLength;
uint8_t buffer[30];	
} bufferStruct; 

// public functions
void initCommunication();
void checkReceiveData(bufferStruct buffer);
void sendData(bufferStruct buffer, uint8_t ack);

// internal functions don't use externaly
uint8_t validateCrc(bufferStruct buffer);
void sendNack(bufferStruct buffer);
void sendAck(bufferStruct buffer);
void processAck();
void processNack();
bufferStruct receiveSendData(bufferStruct buffer);

#endif /* PROTSTATEMACHINE_H_ */