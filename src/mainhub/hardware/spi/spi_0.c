/***************************************************************************
 *            spi_0.c
 *
 *  Mon Jul 31 21:46:47 2006
 *  Copyright  2006  Dirk Broßwick
 *  Email: sharandac@snafu.de
 ****************************************************************************/
/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include <avr/io.h>
#include "spi_0.h"

#if !defined(__AVR_XMEGA__)

void SPI0_init( void )
{
	// SCK auf Hi setzen
	SPI0_PORT |= 1<<SCK| 1<<SS;
	// MOSI, SCK, SS als Output
	SPI0_DDR  |= 1<<MOSI | 1<<SCK | 1<<SS; // mosi, sck, ss output
	// MISO als Input
	SPI0_DDR  &= ~( 1<<MISO ); // miso input

	// Master mode
	SPCR = 1<<MSTR | 1<<SPE ;

	SPSR = 1<<SPI2X;	
}

char SPI0_ReadWrite( char Data )
{
	// daten senden
	SPDR = Data;
	// auf fertig warten
	while(!(SPSR & (1<<SPIF)));
	// empfangende daten einlesen
	Data = SPDR;
	// daten zurueckgeben
	return( Data );
}

void SPI0_FastMem2Write( char * buffer, int Datalenght )
{
	unsigned int Counter = 0;
	unsigned char data;
	
	// erten Wert senden
	SPDR = buffer[ Counter++ ];
	while( Counter < Datalenght )
	{
		// Wert schon mal in Register holen, schneller da der Wert jetzt in einem Register steht und nicht mehr aus dem RAM geholt werden muss
		// nachdem das senden des vorherigen Wertes fertig ist,
		data = buffer[ Counter ];
		// warten auf fertig
		while(!(SPSR & (1<<SPIF)));
		// Wert aus Register senden
		SPDR = data;
		Counter++;
	}
	while(!(SPSR & (1<<SPIF)));
	return;
}

void SPI0_FastRead2Mem( char * buffer, int Datalenght )
{
	unsigned int Counter = 0;
	unsigned char data;
	
	// dummywrite
	SPDR = 0x00;

	while( Counter < Datalenght )
	{
		// warten auf fertig
		while(!(SPSR & (1<<SPIF)));
/*
		// einfache Optimierung
		// Daten einlesen
		data = SPDR;
		// dummy-write
		SPDR = 0x00;		
*/
		// bessere Optimierung, aber nicht auf jeden controller
		// dummy-write
		SPDR = 0x00;		
		// Daten einlesen
		data = SPDR;

		// speichern
		buffer[ Counter++ ] = data;
	}
	while(!(SPSR & (1<<SPIF)));
	return;
}

#endif
