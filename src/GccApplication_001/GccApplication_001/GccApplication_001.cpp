/*
 * GccApplication_001.cpp
 *
 * Created: 30.06.2013 20:55:51
 *  Author: admin
 */ 


#include <avr/io.h>

#include <string.h> // Für "strcmp"
#include <stdlib.h> // Für "itoa"

#include "uart_232.h"  // serielle Routinen

#include <util/delay.h>
#include "i2cmaster.h"


#define B(x) ( \
0##x >>  0 & 0001 | \
0##x >>  2 & 0002 | \
0##x >>  4 & 0004 | \
0##x >>  6 & 0010 | \
0##x >>  8 & 0020 | \
0##x >> 10 & 0040 | \
0##x >> 12 & 0100 | \
0##x >> 14 & 0200 )


/* Bit setzen */
#define set_bit(var, bit) ((var) |= (1 << (bit)))

/* Bit löschen */
#define clear_bit(var, bit) ((var) &= (unsigned)~(1 << (bit)))

/* Bit togglen */
#define toggle_bit(var,bit) ((var) ^= (1 << (bit)))


int main(void)
{	
	// globalen Interrupt einschalten
	sei() ;
	
	/* Port D setzen
	
	 * RxD      an Port D 0  = 0
	 * TxD      an Port D 1  = 0
	
	 * Taster 1 an Port D 2  = 0
	 * Taster 2 an port D 3  = 0
	 * Taster 3 an port D 4  = 0
	
	 * LED 1    an Port D 5  = 1
	 * LED 2    an Port D 6  = 1
	
	 * Summer   an Port D 7  = 1
	 */
		
	// DatenRichtungsRegister Port D setzen
	DDRD = B(11100000) ;
	PORTD = B(00000000) ;
	
	// UART initialisieren
	uart_9600() ;
	
	// String ausgeben
	uart_putstring("Hallo hier ist das serielle Port!.....\r\n") ;
	
	
    while(1)
    {
     
		// wenn bit 2 am Port D gesetzt ist, dann
        if (bit_is_set (PIND,2))
		{
			// bit 5 setzen
	        set_bit(PORTD,5) ;
		}
		else
		{
			// bit 5 löschen
			clear_bit(PORTD,5) ;
		}
		
		// wenn bit 3 am Port D gesetzt ist, dann
		if (bit_is_set (PIND,3))
		{
			// bit 6 setzen
			set_bit(PORTD,6) ;
		}
		else
		{
			// bit 6 löschen
			clear_bit(PORTD,6) ;
		}
		
		// wenn bit 4 am Port D gesetzt ist, dann
		if (bit_is_set (PIND,4))
		{
			// bit 7 setzen
			set_bit(PORTD,7) ;
			
			// String ausgeben
			uart_putstring("Hallo Welt!...\r\n") ;
			
			_delay_ms(500) ;
		}
		else
		{
			// bit 7 löschen
			clear_bit(PORTD,7) ;
		}
		
		
    }
    
	return 0 ;

}