/*! \file openhab.c \brief Ein sehr einfacher openhab client */
//***************************************************************************
//*            openhab.c
//*
//*  Sat Jun  3 23:01:42 2006
//*  Copyright  2006 Dirk Broßwick
//*  Email: sharandac@snafu.de
//****************************************************************************/
///	\ingroup software
///	\defgroup openhab Ein sehr einfacher openhab client (openhab.c)
///	\code #include "openhab.h" \endcode
///	\par Uebersicht
/// 	Ein sehr einfacher openhab-client der auf dem Controller läuft. Ermöglicht
/// das Abfragen vom Status des Controllers und diverse andere Dinge.
/// \date	04-18-2008: -> Der Blödsinn mit Windows ist beseitigt, geht jetzt. Es wird jetzt pro Durchlauf versucht, den Puffer auszulesen und
///			erst wenn eine Eingabe mit 0x0a,0x0d (LF, CR) abgeschlossen wird, gehts ab an die Verarbeitung des Strings. Was für ein Akt :-) und alles wegen
///			Windows.
/// \date   05-25-2009: Umstellung der Telnetstruktur und Ausführung der Kommandos.
/// \date	01-01-2010:	Umstellung der Telnetstruktur für das ausführen und registrieren von Telnetkommandos. Diese werden jetzt von extern Registriert, so das ein
///			saubere Trennung besteht.
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
#include <avr/pgmspace.h>
#include <avr/version.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "../../config.h"

#if defined(OPENHABSERVER)

#include "../../system/net/tcp.h"
#include "../../system/stdout/stdout.h"
#include "../../system/thread/thread.h"
#include "../../system/shell/shell.h"

#include "../../system/clock/clock.h"

#include "openhab.h"

static struct OPENHAB_SESSION openhab_session;

uint8_t timer = 0;
char bufferString[100];

void timerCallback(){
	if(timer++ > 10){
		printf_P(PSTR("timeout called\r\n"));
		CLOCK_RemoveCallbackFunction(timerCallback);
		timer = 0;		
		if(!openhab_send(bufferString)){
			printf_P(PSTR("problem sending data\r\n"));
		}
	}

}

/**
 * \brief Initialisiert den openhab-clinet und registriert den Port auf welchen dieser lauschen soll.
 * \param 	NONE
 * \return	NONE
 */
void openhab_init( void )
{
	RegisterTCPPort( OPENHAB_PORT );
	printf_P( PSTR("openhab-Server Port %d.\r\n") , OPENHAB_PORT );
	THREAD_RegisterThread( openhab_thread, PSTR("openhab"));
}


/**
 * \brief Der openhab-client an sich. Er wird zyklisch aufgerufen und schaut nach ob eine Verbindung auf den
 * registrierten Port eingegangen ist. Wenn ja holt er sich die Socketnummer der Verbindung und speichert diese.
 * Wenn eine Verbindung zustande gekommen ist wird diese wiederrum zyklisch nach neuen Daten abgefragt und entsprechend
 * reagiert.
 * \param 	NONE
 * \return	NONE
 */
void openhab_thread( void )
{
	struct STDOUT oldstream;
	char Data; 
	
	// keine alte Verbindung offen?
	if ( openhab_session.SOCKET == NO_SOCKET_USED )
	{ 	
		// auf neue Verbindung testen
		openhab_session.SOCKET = CheckPortRequest( OPENHAB_PORT );
		if ( openhab_session.SOCKET != NO_SOCKET_USED )
		{	
			STDOUT_save( &oldstream );
			STDOUT_set( _TCP, openhab_session.SOCKET );
			// Wenn ja, Startmeldung ausgeben und startzustand herstellen für telnet
			printf_P( PSTR( "Und, los geht's...!!! (\"help\" hilft :-))\r\n> " ));
			STDOUT_restore( &oldstream );

			// OPENHAB_BUFFER leeren und auf Ausgangszustand setzen
			openhab_session.STATE = 0;
			openhab_session.POS = 0;
			openhab_session.BUFFER[0] = '\0';
			openhab_session.STATE = 0;

			FlushSocketData( openhab_session.SOCKET );
		}
	}
	// Wenn alte Verbindung offen hier weiter:
	else
	{
		// checken, ob noch offen ist
		if( CheckSocketState( openhab_session.SOCKET ) != SOCKET_READY )
		{
			openhab_session.SOCKET = NO_SOCKET_USED;
			return;
		}

		// Auf neue Daten zum zusammenbauen testen
		// hier wird der TELNET_BUFFER aufgefüllt bis 0x0a oder 0x0d eintreffen. der Puffer ist statisch
		// Wenn ein 0x0a oder 0x0d empfangen wurde, wird der TELNET_STATE auf 1 gesetzt, damit er verarbeitet werden kann
		if ( openhab_session.STATE == 0 )
		{	

			while( GetBytesInSocketData( openhab_session.SOCKET ) >= 1 )
			{
				Data = ( GetByteFromSocketData ( openhab_session.SOCKET ) );
				if ( Data != 0x0a && Data <= 0x7f)
				{
					if ( openhab_session.POS < OPENHAB_BUFFER_LEN )
					{
						openhab_session.BUFFER[ openhab_session.POS++ ] = Data;
						openhab_session.BUFFER[ openhab_session.POS ] = '\0';
					}
					if ( Data == 0x0d )
					{
						openhab_session.STATE = 1;
						break;
					}
				}
			}
		}	

		// Wenn OPENHAB_BUFFER eine Zeile vollständig hat gehts hier weiter
		if ( openhab_session.STATE == 1 )
		{

			STDOUT_save( &oldstream );
			STDOUT_set( _TCP, openhab_session.SOCKET );

			// auf QUIT checken
			if ( !strcmp_P( openhab_session.argv[ 0 ] , PSTR("quit") ) ) 
			{
				// Socket schließen
				printf_P( PSTR("Quiting\r\n") );
				STDOUT_Flush();
				STDOUT_set( RS232, 0);
				CloseTCPSocket( openhab_session.SOCKET );
				openhab_session.SOCKET = NO_SOCKET_USED;
				return;
			} else	{
				STDOUT_Flush();
				STDOUT_set( RS232, 0);
				printf_P(PSTR("string: %s \r\n"), openhab_session.BUFFER);
				printf(openhab_session.BUFFER);
				printf_P(PSTR("\r\n"));
				
				memcpy(bufferString, openhab_session.BUFFER, openhab_session.POS);
				CLOCK_RegisterCallbackFunction(timerCallback, SECOUND);
			}

			STDOUT_restore( &oldstream );

			openhab_session.STATE = 0;
			openhab_session.POS = 0;
			openhab_session.BUFFER[0] = '\0';
			openhab_session.STATE = 0;
		}
	}
}

uint8_t openhab_send( char* sending ){
	struct STDOUT oldstream;
	if ( openhab_session.SOCKET == NO_SOCKET_USED ){
		STDOUT_save( &oldstream );
		STDOUT_set( _TCP, openhab_session.SOCKET );
		printf(sending);
		STDOUT_restore( &oldstream );

	} else {
		return -1;
	}
	return 0;	
}


#endif
	
//@}
