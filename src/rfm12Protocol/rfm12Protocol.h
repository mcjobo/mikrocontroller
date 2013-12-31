/*
 * protStatemachine.h
 *
 * Created: 23.09.2013 15:53:41
 *  Author: jbolay
 */ 


#ifndef PROTSTATEMACHINE_H_
#define PROTSTATEMACHINE_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include <rfm12.h>
#include <util/crc16.h>

#define VERSION 0x00

// ack bits that my be combined with other protocol types
#define NO_ACK			0x00
#define NEED_ACK		0x01
#define ACK				0x02

// protocol type definitions
#define SEND_DATA		0x00
#define REPEATING_DATA	0x01
#define NACK			0x02
#define GET_BACK_AGAIN	0x03
#define NO_DATA			0x04

#define CRC_UART_DEBUG	0

// number of bytes of header overhead
#define OVERHEAD 5


#define STATE_UART_DEBUG	1


// struct to hold the datastream and the length of it
typedef struct{
	uint8_t bufferLength;
	uint8_t buffer[30];	
	uint8_t address;
	uint8_t ackState;
	uint8_t type;
} bufferStruct; 

// buffer to send or receive data
bufferStruct sendBuffer;
bufferStruct receiveBuffer;

extern uint8_t nodeAddress;

// function to get the prot version we are dealing here with
static uint8_t getProtocolVersion(){return VERSION;}
	
// public functions
void initCommunication();
uint8_t checkData();
uint8_t transmitData(bufferStruct sendData);

void copyBuffer(bufferStruct* ziel, bufferStruct* start);
void resetRx();
#endif /* PROTSTATEMACHINE_H_ */