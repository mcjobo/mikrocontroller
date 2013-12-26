/*
 * cmd_openhab.c
 *
 * Created: 19.10.2013 18:18:07
 *  Author: Michael
 */ 

#include <avr/pgmspace.h>
#include <avr/version.h>
#include <avr/eeprom.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "../../config.h"
#include "../../system/stdout/stdout.h"

#include "cmd_openhab.h"


void init_cmd_openhab( void ){
	#if defined(SHELL)
	SHELL_RegisterCMD( cmd_openhab, PSTR("openhab"));
	#endif
}

int cmd_openhab( int argc, char ** argv ){
	printf_P( PSTR("openhab ist toll\r\n"));
	
	if ( argc >= 2 ){
		if ( !strcmp_P( argv[1], PSTR("light") ) ){
			printf_P( PSTR("light: ON\r\n"));
		} else if ( !strcmp_P( argv[1], PSTR("temp") ) ){
			printf_P( PSTR("temperature: 25°C\r\n"));
		} else if ( !strcmp_P( argv[1], PSTR("all") ) ){
			printf_P( PSTR("temperature: 25°C\r\n"));
			printf_P( PSTR("light: ON\r\n"));
		}
	} else {
		printf_P( PSTR("openhab <wanted value> light|temp\r\n"));
	}
	return 0;
}