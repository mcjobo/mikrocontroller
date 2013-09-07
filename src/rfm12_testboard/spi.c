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