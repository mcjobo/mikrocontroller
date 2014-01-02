/*
 * led_strip.c
 *
 * Created: 31.12.2013 09:13:17
 *  Author: jbolay
 */ 
#include "conf/global.h"

#include <avr/io.h>
#include <util/delay.h>

#include "extint.h"
#include "uart2.h"
#include "rprintf.h"



int main(void)
{
		
	uart_init();
	rprintfInit(uart_putc);
	
	rprintf1("init\r\n");
	
	DDRB |= (_BV(PB0));
	DDRB &= ~(_BV(PB1));
    while(1)
    {
		u08 input = PINB & 2;
		if(input){
			PORTB |= (_BV(PB0));
		} else {
			PORTB &= ~(_BV(PB0));
		}
		
    }
}