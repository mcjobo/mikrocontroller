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

void rx_data(){
	if (rfm12_rx_status() == STATUS_COMPLETE)
	{
		uint8_t i;
		uart_putstr ("new packet:\r\n");

		bufcontents = rfm12_rx_buffer();

		// dump buffer contents to uart
		for (i=0;i<rfm12_rx_len();i++)
		{
			uart_putc ( bufcontents[i] );
		}
		uart_putstr ("\r\n");
		// tell the implementation that the buffer
		// can be reused for the next data.
		rfm12_rx_clear();

	} 
}


int main(void)
{
	uart_init();
	//_delay_ms(500);
	uint8_t teststring[] = "ich liebe dich";
	uint8_t packettype = 0xEE;
	rfm12_init();  /* initialize the library */
	sei();
	
	uart_putstr ("init\r\n");

	rfm12_rx_clear();
	//rfm12_tx (sizeof(teststring), packettype, teststring);
		
	while (1)
	{
		//rfm12_tx (sizeof(teststring), packettype, teststring);
		rx_data();
		rfm12_tick();  /* periodic tick function - call that one once in a while */
		//_delay_ms(1000);
	}
}
