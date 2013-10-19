/*
 * Protokol.c
 *
 * Created: 21.09.2013 18:07:21
 *  Author: jbolay
 */ 


#include "protocol.h"


uint8_t* encode(uint8_t ack, uint8_t type, uint8_t address, uint8_t length, uint8_t* data){
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

uint16_t createCrc(uint8_t length, uint8_t* data){
	uint16_t crc = 0;
	#if CRC_UART_DEBUG >= 3
		uart_putc('@');
	#endif
	for (uint8_t i = 0; i < length; i++){
		crc = _crc_ccitt_update(crc, data[i]);
		#if CRC_UART_DEBUG >= 3
			uart_putc(data[i]);
		#endif
	}
	#if CRC_UART_DEBUG >= 3
		uart_putc('@');
		uart_putc(crc>>8);
		uart_putc(crc&0x00ff);
		uart_putc('@');
	#endif
	return crc;
}

uint8_t checkCrc(uint8_t length, uint8_t* data, uint16_t crc){
	uint16_t newCrc = createCrc(length, data);
	#if CRC_UART_DEBUG >= 1
		uart_putc('@');
		uart_putc(newCrc>>8);
		uart_putc(newCrc&0x00ff);
		uart_putc('@');
		uart_putc(crc>>8);
		uart_putc(crc&0x00ff);
		uart_putc('@');
	#endif
	if(newCrc == crc){
		return 1;
	}
	return 0;
}

uint8_t getPayloadLength(uint8_t length, uint8_t* data){
	return length - OVERHEAD;
}

uint8_t getVersion(uint8_t length, uint8_t* data){
	uint8_t byte = data[0];
	byte = byte & 0xf8;
	byte = byte>>3;
	return byte;
}

uint8_t getAck(uint8_t length, uint8_t* data){
	uint8_t byte = data[0];
	byte = byte & 0x07;
	return byte;
}

uint8_t getType(uint8_t length, uint8_t* data){
	uint8_t byte = data[1];
	return byte;
}

uint8_t getAddress(uint8_t length, uint8_t* data){
	uint8_t byte = data[2];
	return byte;
}

uint8_t* getPayload(uint8_t length, uint8_t* data){
	return data+3;
}

uint16_t getCrc(uint8_t length, uint8_t* data){
	uint16_t crc = (data[length-2]);
	crc = crc<<8;
	crc = crc | (data[length-1]);
	return crc;
}