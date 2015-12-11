#include "led.h"

void led_init(void)
{
	sbi(LED_DDR, LED_PIN);
}

void led_dbg(uint8_t ms)
{
	sbi(LED_PORT, LED_PIN);
	_delay_ms(ms);
	cbi(LED_PORT, LED_PIN);
}

void led_switch(bool b_on)
{
	if (b_on)
	{
		sbi(LED_PORT, LED_PIN);
	}
	else
	{
		cbi(LED_PORT, LED_PIN);
	}
}

void led_blink(uint16_t on, uint16_t off, uint8_t times)
{
	uint8_t i;
	
	for (i = 0; i < times; i++)
	{
		sbi(LED_PORT, LED_PIN);
		_delay_ms(on);
		cbi(LED_PORT, LED_PIN);
		_delay_ms(off);
	}
}