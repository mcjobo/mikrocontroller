/*! \file xram.c \brief Aktiviert das externe RAM-Interface */
//***************************************************************************
//*            xram.c
//*
//*  Sat Jun  3 23:01:42 2006
//*  Copyright  2006  User
//*  Email
//****************************************************************************/
///	\ingroup hardware
///	\defgroup xram Aktiviert das externe RAM-Interface (xram.c)
///	\code #include "xram.h" \endcode
///	\par Uebersicht
/// Aktiviert das externe RAM-Interface. Wenn die xram.h eingebunden wird, wird
/// automatisch die Aktivierung in .init eingetragen und steht somit sofort zur
/// VerfÃ¼gung.
//****************************************************************************/
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
//@{

#include <avr/io.h>
#include "../../config.h"

#if defined EXTMEM

#include "xram.h"

#if defined(LED)
	#include "hardware/led/led_core.h"
#endif

/*------------------------------------------------------------------------------------------------------------*/
/*!\brief Aktiviert das externe RAM-Interface und testet den externen RAM
 * \param 	NONE
 * \return	NONE
 */
/*------------------------------------------------------------------------------------------------------------*/
void __attribute__ ((naked, section(".init3"))) init_xram (void)
{
#if !defined(__AVR_XMEGA__)
	// externes RAM-Interface freigeben
	XMCRA |= ( 1<<SRE );
	// A16 freigeben, hÃ¤ngt an PD7, damit der RAM funktioniert, wenn dies nicht gemacht wird, ist A16 tristate und der RAM macht komische sachen :-)
	DDRD |= ( 1<<PD7 );
	PORTD |= ( 1<<PD7 );
#else

	#define   SDRAM_ADDR (0x4000)
	
	PORTH.OUT = 0x0F;                      // EBI PORTs richten
	PORTH.DIR = 0xFF;
	PORTK.DIR = 0xFF;
	PORTJ.DIR = 0xF0;

	EBI.CTRL       = EBI_SDDATAW_4BIT_gc | EBI_IFMODE_3PORT_gc;
	EBI.SDRAMCTRLA = (EBI.SDRAMCTRLA & ~(EBI_SDCAS_bm | EBI_SDROW_bm | EBI_SDCOL_gm)) |
	                  EBI_SDCOL_10BIT_gc | EBI_SDROW_bm;
	EBI.SDRAMCTRLB = EBI_MRDLY_0CLK_gc | EBI_ROWCYCDLY_1CLK_gc | EBI_RPDLY_0CLK_gc;
	EBI.SDRAMCTRLC = EBI_WRDLY_0CLK_gc | EBI_ESRDLY_0CLK_gc    | EBI_ROWCOLDLY_0CLK_gc;
	EBI.REFRESH    = 0xff00;
	EBI.INITDLY    = 0x0100;
	EBI.CS3.CTRLB  = (EBI.CS3.CTRLB & ~(EBI_CS_SDSREN_bm | EBI_CS_SDMODE_gm)) |
	                  EBI_CS_SDMODE_NORMAL_gc;
	EBI.CS3.BASEADDR = (((uint32_t) SDRAM_ADDR)>>8) & (0xFFFF<<(EBI_CS_ASIZE_8MB_gc>>2));
	EBI.CS3.CTRLA  = (EBI.CS3.CTRLA & ~(EBI_CS_ASIZE_gm | EBI_CS_MODE_gm)) |
	                  EBI_CS_ASIZE_8MB_gc | EBI_CS_MODE_SDRAM_gc;

	while(!(EBI.CS3.CTRLB & EBI_CS_SDINITDONE_bm)); // warten bis fertig
	
#endif
	
#if defined(LED)
	LED_init();

	LED_on( 0 );
#endif
	
	char * p = (char *) 0x2200;
	
	char data = 0;
	char fehler = 0;
	int adress = 1;
	long i,a;
	int adressbit = 0 ;

	for( i = 0x2200 ; i<0xffff ; i++ )
	{
		p++;

		data=1;
		
		for( a = 0 ; a < 8 ; a++ )
		{
			data = 1<<a;
			*p = data;
			if ( *p != data )
			{
				fehler++;
				break;
			}
		}		
		*p = 0x00;
	}

	if ( fehler != 0 )
		while(1);
#if defined(LED)
	else
		LED_on( 1 );
#endif
	
	p = (char*) adress;
	
	for( adressbit = 0 ; adressbit < 16 ; adressbit++ )
	{
		p = 	adress * 2 ;
		adress = p ;
		*p = 0x00;
		
		fehler=0;
		
		for( i = 0x8000 ; i<0xffff ; i++ )
		{
			p = i ;
			if ( *p != 0x00 )
			{
				fehler++;
			}
		}
		if ( fehler != 0 )
			while(1)
				
		p = ( 1 << adressbit ) ;
		*p = 0x00;
	}
#if defined(LED)
	LED_on( 2 );
	PORTD &= ~( 1<<PD7 );
#endif
	
	return;
}
#endif

//@}
