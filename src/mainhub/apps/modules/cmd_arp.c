/***************************************************************************
 *            cmd_arp.c
 *
 *  Thu Nov  5 17:02:56 2009
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

/**
 * \ingroup modules
 * \addtogroup cmd_arp Shell-Interface zu arp (cmd_arp.c)
 *
 * @{
 */

/**
 * \file
 *
 * \author Dirk Broßwick
 */
 
#include <avr/pgmspace.h>
#include <avr/version.h>
#include <avr/eeprom.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "../../system/net/arp.h"
#include "../../system/net/ip.h"
#include "../../system/stdout/stdout.h"

#include "../../system/shell/shell.h"
#include "cmd_arp.h"

void init_cmd_arp( void )
{
#if defined(SHELL)
	SHELL_RegisterCMD( cmd_arp, PSTR("arp"));
#endif
}

int cmd_arp( int argc, char ** argv )
{
	char MACbuffer[6];
	int i;
	char IPstr[20];
	char MACstr[20];
	
	long IP;
	unsigned char ttl;
		
	printf_P( PSTR("IP/MAC/TTL\r\n") );
				
	for ( i = 0; i < MAX_ARPTABLE_ENTRYS ; i++ )
	{
		if( GetARPtableEntry ( i, &IP, MACbuffer, &ttl ) == 1 )
		{
			if ( ttl != 0 )
			{
				printf_P( PSTR("%s / %s / %d\r\n"), iptostr( IP, IPstr ), mactostr( MACbuffer, MACstr ), ttl );
			}
		}
	}

	return(0);
}

/**
 * @}
 */
