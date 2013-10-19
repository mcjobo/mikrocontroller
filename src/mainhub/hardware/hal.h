/***************************************************************************
 *            hal.h
 *
 *  Sun Dec 13 16:45:12 2009
 *  Copyright  2009  Dirk Broßwick
 *  <sharandac@snafu.de>
 ****************************************************************************/

/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor Boston, MA 02110-1301,  USA
 */
 #ifndef _HAL_H
	#define _HAL_H

	#define __SYSTEM					0
	#define __GPIO_OUT					1
	#define __GPIO_IN					2
	#define	__GPIO_IN_PULLUP			3
	#define	__ADC						4
	#define __TWI						5
	#define	__ONEWIRE					6
	#define __PCINT						7
	#define	__EXTINT					8
	#define __UART						9
	#define	__SPI						10
	#define	__SPI_CS					11
	#define	__LCD						12
	#define	__XRAM						13
	#define	__LED						14
	#define __MMC					16

#if defined(__AVR_ATmega644__)
	#define	HAL_PINCOUNT		32
#elif defined(__AVR_ATmega644P__)
	#define	HAL_PINCOUNT		32	
#elif defined(__AVR_ATmega2561__)
	#define	HAL_PINCOUNT		48
#endif

	void HAL_printconfig( void );

	typedef struct {
		volatile char			HAL_Config;
	} HAL ;

#endif
