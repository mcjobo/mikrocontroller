/*
 * Protocol.h
 *
 * Created: 21.09.2013 18:07:33
 *  Author: jbolay
 */ 


#ifndef PROTOCOL_H_
#define PROTOCOL_H_

#include <avr/io.h>
#include <util/crc16.h>
#include <string.h>
#include "uart.h"

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


#endif /* PROTOCOL_H_ */