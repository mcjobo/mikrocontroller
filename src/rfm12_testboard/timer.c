/*
 * timer.c
 *
 * Created: 27.09.2013 13:50:20
 *  Author: jbolay
 */ 
#include "timer.h"

volatile uint16_t millisekunden;
volatile uint16_t targetMs;

volatile void (*functionPtr)();

void startTimer(uint16_t miliseconds, void (*functionPtr)()){
	TCCR0A = (1<<WGM01); // CTC Modus
	TCCR0B |= (1<<CS01); // Prescaler 8
	// ((1000000/8)/1000) = 125
	OCR0A = 125-1;
	
	// Compare Interrupt erlauben
	TIMSK |= (1<<OCIE0A);
	
	// Global Interrupts aktivieren
	sei();
}

/*
Der Compare Interrupt Handler
wird aufgerufen, wenn
TCNT0 = OCR0A = 125-1
ist (125 Schritte), d.h. genau alle 1 ms
*/
ISR (TIMER0_COMPA_vect)
{
	millisekunden++;
	if(millisekunden >= targetMs){
		(*functionPtr)();
	}
}