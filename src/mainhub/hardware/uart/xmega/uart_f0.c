/***************************************************************************
 *            uart_f0.c
 *
 *  Thu Dec  9 11:21:03 2010
 *  Copyright  2010  sharan
 *  <sharan@<host>>
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
#include <avr/pgmspace.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "../../../hardware/uart/uart_core.h"
#include "../../../system/buffer/fifo.h"

#if defined(__AVR_XMEGA__)

#include "uart_f0.h"
#include "uart_xmega.h"

volatile char TX_F0_state = TX_complete;

char TX_F0_Buffer[ TX_Bufferlen ];
char RX_F0_Buffer[ RX_Bufferlen ];

int RX_F0_fifo;
int TX_F0_fifo;

/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Initialisiert die Uart0.
 * \param	NONE
 * \return  NONE
 */
/* -----------------------------------------------------------------------------------------------------------*/
void UART_F0_init( void )
{
	// FIFO reservieren für RX und TX
	RX_F0_fifo = Get_FIFO( RX_F0_Buffer, RX_Bufferlen );
	TX_F0_fifo = Get_FIFO( TX_F0_Buffer, TX_Bufferlen );

	// TX_state auf complete setzen, da ja nix gesendet wurde
	TX_F0_state = TX_complete;

	/* PIN3 (TXF0) as output. */
	PORTC.DIRSET = PIN3_bm;
	/* PC2 (RXF0) as input. */
	PORTC.DIRCLR = PIN2_bm;
	/* USARTF0, 8 Data bits, No Parity, 1 Stop bit. */
	USART_Format_Set( &USARTF0 , USART_CHSIZE_8BIT_gc, USART_PMODE_DISABLED_gc, 0 );
	/* Set Baudrate to 9600 bps */
	USART_Baudrate_Set( &USARTF0 , ( UBRR_VAL ) , 0 );
	/* Enable both RX and TX. */
	USART_Rx_Enable( &USARTF0 );
	USART_Tx_Enable( &USARTF0 );
	USART_RxdInterruptLevel_Set( &USARTF0 , USART_RXCINTLVL_HI_gc );
	
	return;
}

/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Interruptroutine zum senden, wenn Transmiter ist fertig und keine weiteren Daten im Puffer
 */
/* -----------------------------------------------------------------------------------------------------------*/
ISR( USARTF0_TXC_vect )
{
	USART_TxdInterruptLevel_Set( &USARTF0 , USART_TXCINTLVL_OFF_gc );
	TX_F0_state = TX_complete;	
}

/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Interruptroutine zum senden, wird aufgerufen wenn UART-Register leer, aber Transmitter noch am senden
 */
/* -----------------------------------------------------------------------------------------------------------*/
ISR( USARTF0_DRE_vect )
{

	// checken ob noch bytes im Buffer sind
	if ( Get_Bytes_in_FIFO ( TX_F0_fifo ) != 0 )
	{
		USART_PutChar( &USARTF0 , Get_Byte_from_FIFO ( TX_F0_fifo ) );
	}
	else
	{
		// Wenn nicht war es das letzte Byte im Puffer, dann diesen Interrupt sperren und TX-Interrupt freigeben
		USART_TxdInterruptLevel_Set( &USARTF0 , USART_TXCINTLVL_HI_gc );
		USART_DreInterruptLevel_Set( &USARTF0 , USART_DREINTLVL_OFF_gc );
	}
}
/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Interruptroutine zum empfangen
 */
/* -----------------------------------------------------------------------------------------------------------*/
ISR( USARTF0_RXC_vect )
{
	char Byte;
			
	Byte = USART_GetChar( &USARTF0 );
	
	if ( Get_Bytes_in_FIFO ( RX_F0_fifo ) < RX_Bufferlen )
		Put_Byte_in_FIFO ( RX_F0_fifo, Byte );
}

/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Sendet ein Byte über die Uart1.
 * \param	ein Byte vom typ unsigned char
 * \return  NONE
 */
/* -----------------------------------------------------------------------------------------------------------*/
void UART_F0_SendByte( char Byte )
{
	char temp;

	temp = SREG;
	cli();
	
	if ( Get_Bytes_in_FIFO ( TX_F0_fifo ) == 0 )
	{
		// Wenn Controller noch mit senden eines Byte beschäftig, ab in den Puffer
		if ( TX_F0_state == TX_sending )
		{			
			// Byte in Buffer schreiben
			Put_Byte_in_FIFO ( TX_F0_fifo, Byte );
			
			// Buffer Empty Interrupt freigeben, TX_complete sperren
			USART_TxdInterruptLevel_Set( &USARTF0 , USART_TXCINTLVL_OFF_gc );
			USART_DreInterruptLevel_Set( &USARTF0 , USART_DREINTLVL_HI_gc );
		}
		else
		{
			// Buffer Empty sperren, TX_complete freigeben
			USART_PutChar( &USARTF0, Byte );
			// Buffer Emty sperren, TX_complete freigeben
			USART_TxdInterruptLevel_Set( &USARTF0 , USART_TXCINTLVL_HI_gc );
			USART_DreInterruptLevel_Set( &USARTF0 , USART_DREINTLVL_OFF_gc );

			TX_F0_state = TX_sending;
		}
	}
	else
	{	
		// Wenn Puffer voll, warten bis wieder was rein paßt
		while ( 1 )
		{
			cli();
			
			if ( Get_Bytes_in_FIFO ( TX_F0_fifo ) < TX_Bufferlen ) break;
			
			SREG = temp;
		}

		// Byte in Buffer schreiben
		Put_Byte_in_FIFO ( TX_F0_fifo, Byte );
	}
	
	SREG = temp;
}

/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Empfängt ein Byte über die Uart1.
 * \param	NONE
 * \return  Byte aus den Puffer
 */
/* -----------------------------------------------------------------------------------------------------------*/
char UART_F0_GetByte( void )
{
	char Byte=0;
	char temp;
	
	temp = SREG;
	cli();
	
	// check ob überhaupt noch Bytes im Puffer sind, und wenn ja, auslesen
	if ( Get_Bytes_in_FIFO ( RX_F0_fifo ) != 0 )
		Byte = Get_Byte_from_FIFO ( RX_F0_fifo );
	
	SREG = temp;
	
	return( Byte );
}

/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Liest die Anzahl der Byte die im Empfangsbuffer sind.
 * \param	NONE
 * \return  Anzahl der Byte im Enpfangpuffer
 */
/* -----------------------------------------------------------------------------------------------------------*/
int UART_F0_GetBytesinRxBuffer( void )
{
	int BytesInBuffer=1;
	char temp;

	temp = SREG;
	cli();
	
	// Anzahl der Bytes holen
	BytesInBuffer = Get_Bytes_in_FIFO ( RX_F0_fifo );
	
	SREG = temp;
	
	return( BytesInBuffer );
}

/* -----------------------------------------------------------------------------------------------------------*/
/*!\brief Liest die Anzahl der Byte die im Empfangsbuffer sind.
 * \param	NONE
 * \return  Anzahl der Byte im Enpfangpuffer
 */
/* -----------------------------------------------------------------------------------------------------------*/
int UART_F0_GetBytesinTxBuffer( void )
{
	int BytesInBuffer=1;
	char temp;

	temp = SREG;
	cli();
	
	// Anzahl der Bytes holen
	BytesInBuffer = Get_Bytes_in_FIFO ( TX_F0_fifo );
	
	SREG = temp;
	
	return( BytesInBuffer );
}

#endif
