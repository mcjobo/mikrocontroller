/*
 * rfm12_dev.c
 *
 * Created: 17.08.2013 23:36:58
 *  Author: jbolay
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include "rfm12.h"
#include "protocol.h"

uint8_t bufferLength;
uint8_t *bufcontents;


uint8_t received = 0;

void rx_data(){
	if (rfm12_rx_status() == STATUS_COMPLETE)
	{
		uint8_t i;
		uart_putstr ("new packet:\r\n");

		bufcontents = rfm12_rx_buffer();
		bufferLength = rfm12_rx_len();

		// dump buffer contents to uart		
		uint8_t* payload = getPayload(bufferLength, bufcontents);
		for (i=0;i<getPayloadLength(bufferLength, bufcontents);i++)
		{
			uart_putc ( payload[i] );
		}
		uart_putstr ("\r\n");
		
		uint16_t crc = (bufcontents[bufferLength-1])|(bufcontents[bufferLength-2]<<8);
		uint8_t ack = checkCrc(bufferLength-2, bufcontents, crc);
		if(ack){
			uart_putstr ("ack\r\n");
		} else {
			uart_putstr ("nack\r\n");
		}
		
		// tell the implementation that the buffer
		// can be reused for the next data.
		received = 1;
		rfm12_rx_clear();
	} 
}

void sendData(uint8_t length, uint8_t* data){
	
	rfm12_tx (length+4, encode(0x03, 0x05, length, data));
}

// main for reply received data
/*int main(void)
{
	uart_init();
	//_delay_ms(500);
	uint8_t teststring[] = "ich liebe dich";
	uint8_t packettype = 0xEE;
	rfm12_init();  // initialize the library
	sei();
	
	uart_putstr ("init\r\n");

	rfm12_rx_clear();
	
	while (1)
	{
		if(received){
			uart_putstr ("s\r\n");
			_delay_ms(100);
			rfm12_tx (bufferLength, bufcontents);
			received = 0;
		}
		
		rx_data();
		rfm12_tick();  // periodic tick function - call that one once in a while
		//_delay_ms(1000);
	}
}*/

// main for sending data and sending new data
int main(void)
{
	uart_init();
	//_delay_ms(500);
	uint8_t teststring[] = "asd12";
	uint8_t packetLength = sizeof(teststring);
	rfm12_init();  // initialize the library
	sei();
	
	uart_putstr ("init\r\n");

	rfm12_rx_clear();
	//rfm12_tx (sizeof(teststring), teststring);
		
	uint16_t counter = 20000;
	
	while (1)
	{		
		rx_data();
		rfm12_tick();  //periodic tick function - call that one once in a while

		if(counter <=0){
			counter = 20000;
			sendData(packetLength, teststring);
			uart_putstr ("send:\r\n");
			for(uint8_t i = 0; i < packetLength; ++i){
				uart_putc(teststring[i]);
			}
			uart_putstr ("\r\n");
			
		}
		--counter;
		if(rfm12_tx_status() == STATUS_OCCUPIED){
			counter = 20000;
		}
	}
}