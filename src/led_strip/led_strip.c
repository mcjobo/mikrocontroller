/*
 * led_strip.c
 *
 * Created: 31.12.2013 09:13:17
 *  Author: jbolay
 */ 
#include "conf/global.h"

#include <avr/io.h>
#include <util/delay.h>
#include <avr/pgmspace.h>

#include "extint.h"
#include "uart2.h"
#include "rprintf.h"
#include "timerx8.h"
#include "time.h"
#include "a2d.h"

#define TIMEOUT 60

volatile u08 timerCounter;
volatile timeStruct time;


void timer();
void printTime(timeStruct* time);

//const u08 pwmtable[32] PROGMEM = {
//	255, 215, 181, 152, 128, 108, 91, 76, 64, 54, 45, 38, 32, 27,
//	23, 19, 16, 13, 11, 10, 8, 7, 6, 5, 4, 3, 3, 2, 2, 2, 1, 0
//};
const u08 pwmtable[32] PROGMEM =
{
	0, 1, 2, 2, 2, 3, 3, 4, 5, 6, 7, 8, 10, 11, 13, 16, 19, 23,
	27, 32, 38, 45, 54, 64, 76, 91, 108, 128, 152, 181, 215, 255
};

int main(void)
{
		
	uart_init();
	rprintfInit(uart_putc);
	
	rprintf1("init\r\n");
	
	DDRB |= (_BV(PB0));
	DDRB &= ~(_BV(PB1));
	
	timer0SetPrescaler(TIMER_CLK_DIV8);
	timerInit();
	
	timerAttach(TIMER0OVERFLOW_INT, &timer);	
	timeStruct timeout;
	
	sbi(DDRB, PB2);
	sbi(TCCR1A, COM1B0);
	sbi(TCCR2A, COM1B1);
	timer1PWMInit(8);
	timer1SetPrescaler(TIMER_CLK_DIV64);
	timer1PWMBOn();
	
	
	a2dInit();
	cbi(DDRC, PC0);
	cbi(PORTC, PC0);
	a2dSetPrescaler(ADC_PRESCALE);
	a2dSetReference(ADC_REFERENCE_AVCC);
	
    while(1)
    {
		u08 input = ~PINB & 2;
		if(input){
			timeout = copyTimeStruct(&time);
			addTimeToTimeStruct(&timeout, 0,0,0,TIMEOUT,0);
		}		
		if(compareTimeStruct(&timeout, &time) > 0){			
			PORTB &= ~(_BV(PB0));
			setWithPWM(1);
		} else {
			PORTB |= (_BV(PB0));
			setWithPWM(0);
		}
		
		
    }
}

void setWithPWM(u08 value){
	if(value == 1){
		u16 lightness = a2dConvert8bit(0);
		u16 prozent = lightness*100 / 245;
		u08 arr = (prozent * 32 /100) -1;
		u08 pwm = pgm_read_byte(& pwmtable[arr]);
		timer1PWMBSet(pwm);
	} else {
		PORTB &= ~(_BV(PB1));
	}
	
}

void timer(){
	++timerCounter;
	if(timerCounter >= 3){
		timerCounter = 0;
		incrMilisecond(&time);
	}
}

void printTime(timeStruct* time){
	rprintf1("day: %d hour: %d minute: %d second: %d\r\n", time->day, time->hour, time->minute, time->second);
}