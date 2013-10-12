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
#include <avr/crc16.h>

#define VERSION 0x00

// ack bits that my be combined with other protocol types
#define NO_ACK			0x00
#define NEED_ACK		0x01
#define ACK				0x03

// protocol type definitions
#define SEND_DATA		0x00
#define REPEATING_DATA	0x01
#define NACK			0x02
#define GET_BACK_AGAIN	0x03
#define NO_DATA			0x04

#define CRC_UART_DEBUG	0

// number of bytes of header overhead
#define OVERHEAD 5


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


// getters to access the data in the prot struct
uint8_t getPayloadLength(uint8_t length, uint8_t* data);
uint8_t getVersion(uint8_t length, uint8_t* data);
uint8_t getAck(uint8_t length, uint8_t* data);
uint8_t getType(uint8_t length, uint8_t* data);
uint8_t getAddress(uint8_t length, uint8_t* data);
uint8_t* getPayload(uint8_t length, uint8_t* data);
uint16_t getCrc(uint8_t length, uint8_t* data);


// function to get the prot version we are dealing here with
static uint8_t getProtocolVersion(){return VERSION;}

// filles the prot struct with the new data given
void createProtocol(uint8_t length, uint8_t version, uint8_t type, uint8_t* payload);
// putes all the protocoll parts in secence and return a pointer to it
uint8_t* encode(uint8_t ack, uint8_t type, uint8_t address, uint8_t lenth, uint8_t* data);
// method to create the crc and returns it
uint16_t createCrc(uint8_t length, uint8_t* data);
// method to check the crc if it is correct
uint8_t checkCrc(uint8_t length, uint8_t* data, uint16_t crc);


#endif /* PROTSTATEMACHINE_H_ */