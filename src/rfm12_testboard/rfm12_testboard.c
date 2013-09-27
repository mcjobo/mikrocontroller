/*
 * rfm12_dev.c
 *
 * Created: 17.08.2013 23:36:58
 *  Author: jbolay
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include "protocol.h"
#include "protStatemachine.h"

bufferStruct buffer;


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
	initCommunication();
	
	uart_putstr ("init\r\n");

	rfm12_rx_clear();
	//rfm12_tx (sizeof(teststring), teststring);
		
	uint16_t counter = 20000;
	
	while (1)
	{		
		checkReceiveData(buffer);
		rfm12_tick();  //periodic tick function - call that one once in a while

		if(counter <=0){
			counter = 20000;
			bufferStruct send;
			send.bufferLength = packetLength;
			memcpy(send.buffer, teststring, send.bufferLength);
			sendData(send, NEED_ACK);
			uart_putstr ("send:\r\n");
			for(uint8_t i = 0; i < packetLength; ++i){
				uart_putc(teststring[i]);
			}
			uart_putstr ("\r\n");
			
		}
		--counter;
	}
}