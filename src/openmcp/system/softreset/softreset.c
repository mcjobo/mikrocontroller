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
#include <avr/wdt.h>
#include "softreset.h"

// Function Implementation
void softreset( void )
{
	do                          
	{                           
   		wdt_enable(WDTO_15MS);  
   		for(;;)                 
   		{                       
   		}                       
	} while(0);
}

// Function Implementation
void wdt_init(void)
{
#if defined(__AVR_XMEGA__)
	wdt_reset();
#else
	MCUSR = 0;
    wdt_disable();
#endif	
    return;
}
