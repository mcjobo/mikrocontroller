/*
 * led_strip.c
 *
 * Created: 31.12.2013 09:13:17
 *  Author: jbolay
 */ 

#define F_CPU 4915200UL  // 1 MHz

#include <avr/io.h>
#include <util/delay.h>



int main(void)
{

	
	//PORTB &= ~(1 << PB0);
	//DDRB |= (1 << DDB0);
	
	DDRB |= (_BV(PB0));
	PORTB &= ~(_BV(PB0));
    while(1)
    {
		_delay_ms(1000);
		PORTB &= ~(_BV(PB0));
		_delay_ms(1000);
		PORTB |= (_BV(PB0));
    }
}