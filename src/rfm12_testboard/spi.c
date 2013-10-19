/*
 * CFile1.c
 *
 * Created: 20.08.2013 19:12:45
 *  Author: jbolay
 */ 
#include <avr/io.h>
#include "spi.h"


void spi_init()
{
	DDR_SPI   |= (_BV(BIT_MOSI));
	DDR_SPI    |= (_BV(BIT_SCK));
	DDR_SPI |= (_BV(BIT_SPI_SS));
	DDR_SPI   &= ~(_BV(BIT_MISO));

	SPCR = (1<<SPE)|(1<<MSTR)|(1<<SPR0);//SPI Master, clk/16
}

/* @description reads the upper 8 bits of the status
 * register (the interrupt flags)
 */
 uint8_t rfm12_read_int_flags_inline()
{
	SS_ASSERT();
	#if !(RFM12_SPI_SOFTWARE)
	SPDR = 0;
	while(!(SPSR & (1<<SPIF)));
	SS_RELEASE();
	return SPDR;

	#else
	unsigned char x, d=d;
	PORT_MOSI &= ~(1<<BIT_MOSI);	
	for(x=0;x<8;x++){
		PORT_SCK |= (1<<BIT_SCK);
		d<<=1;
		if(PIN_MISO & (1<<BIT_MISO)){
			d|=1;
		}
		PORT_SCK &= ~(1<<BIT_SCK);
	}
	SS_RELEASE();
	return d;
	#endif
}