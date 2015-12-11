#ifndef _LED_H_
#define _LED_H_

#include <avr/io.h>
#include <stdbool.h>
#define __DELAY_BACKWARD_COMPATIBLE__
#include <util/delay.h>

#ifndef LED_PIN
	#warning "LED_PIN not yet defined"
	#define LED_PIN 7
	#define LED_PORT PORTD
	#define LED_DDR DDRD
#endif

#define sbi(ADDRESS,BIT) ((ADDRESS) |= (1<<(BIT)))
#define cbi(ADDRESS,BIT) ((ADDRESS) &= ~(1<<(BIT)))

void led_init(void);
void led_dbg(uint8_t ms);
void led_switch(bool b_on);
void led_blink(uint16_t on, uint16_t off, uint8_t times);

#endif // _LED_H_