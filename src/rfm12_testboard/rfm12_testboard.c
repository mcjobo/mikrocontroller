/*
 * rfm12_dev.c
 *
 * Created: 17.08.2013 23:36:58
 *  Author: jbolay
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include "rfm12.h"

uint8_t *bufcontents;
uint8_t bufferLength;

uint8_t received = 0;

void rx_data(){
	if (rfm12_rx_status() == STATUS_COMPLETE)
	{
		uint8_t i;
		uart_putstr ("new packet:\r\n");

		bufcontents = rfm12_rx_buffer();
		bufferLength = rfm12_rx_len();

		// dump buffer contents to uart
		for (i=0;i<rfm12_rx_len();i++)
		{
			uart_putc ( bufcontents[i] );
		}
		uart_putstr ("\r\n");
		// tell the implementation that the buffer
		// can be reused for the next data.
		received = 1;
		rfm12_rx_clear();

	} 
}

// main for reply received data
int main(void)
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
			_delay_ms(100);
			rfm12_tx (bufferLength, bufcontents);
		}
		
		rx_data();
		rfm12_tick();  // periodic tick function - call that one once in a while
		//_delay_ms(1000);
	}
}

// main for sending data and sending new data
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
	rfm12_tx (sizeof(teststring), teststring);
		
	uint16_t counter = 20000;
	
	while (1)
	{
		if(received){
			
			bufferLength = 0;
			received = 0;	
			_delay_ms(100);
			rfm12_tx (sizeof(teststring), teststring);
		}
		
		rx_data();
		rfm12_tick();  //periodic tick function - call that one once in a while
		//_delay_ms(1000);
		// rfm12_tx (sizeof(teststring), teststring);
		if(counter <=0){
			counter = 20000;
			rfm12_tx (sizeof(teststring), teststring);
		}
		--counter;
		if(rfm12_tx_status() == STATUS_OCCUPIED){
			counter = 20000;
		}
	}
}*/