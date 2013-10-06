/*
 * uart_232.h
 *
 * Created: 02.07.2013 23:41:57
 *  Author: M.Scholz
 
 
 
 
 
 
 
 
 volatile
 
 Das Schl�sselwort volatile teilt dem Compiler mit, da� die mit name bezeichnete Variable
 mit dem Datentyp typ durch Ereignisse au�erhalb der Kontrolle des Programms ver�ndert werden
 kann. Der Wert der Variablen mu� deshalb vor jedem Zugriff neu aus dem Hauptspeicher
 eingelesen werden, d.h. er darf nicht in einem Register des Prozessors zwischengespeichert werden
 
 Der Compiler arbeitet bei mit volatile deklarierten Variablen ohne jede Optimierung,
 d.h. l��t die entsprechenden Werte bei jedem Zugriff neu aus dem Hauptspeicher laden und sorgt
 bei Ver�nderungen daf�r, da� die neuen Werte ohne Verz�gerung dort sofort abgelegt werden. 
 
 volatile-Daten sind f�r den geteilten Zugriff verschiedener Prozesse geeignet. 
 
 
 
 */ 


#ifndef UART_232_H_
#define UART_232_H_

#include <avr/io.h>

#include <string.h> // F�r "strcmp"
#include <stdlib.h> // F�r "itoa"
#include <avr/interrupt.h>

#define F_CPU 16000000  // CPU Frequenz
#define BAUD 9600       // default
#include <util/setbaud.h>



// ============================================================================
// Sender und Empf�nger konfigurieren
static void
uart_9600(void)
{
	#undef BAUD  // avoid compiler warning
	#define BAUD 9600
	#include <util/setbaud.h>
	UBRR0H = UBRRH_VALUE;
	UBRR0L = UBRRL_VALUE;
	#if USE_2X
	UCSR0A |= (1 << U2X0);
	#else
	UCSR0A &= ~(1 << U2X0);
	#endif
	
	/* Asynchron, 8N1 */
	UCSR0C = (1<<UMSEL01) | (3<<UCSZ00);

    /* Empf�nger und Sender einschalten 
	   Empf�nger Interrupt einschalten*/
    UCSR0B = (1<<RXEN0) | (1<<TXEN0)  | (1<<RXCIE0) ;
}


static void
uart_19200(void)
{
	#undef BAUD  // avoid compiler warning
	#define BAUD 19200
	#include <util/setbaud.h>
	UBRR0H = UBRRH_VALUE;
	UBRR0L = UBRRL_VALUE;
	#if USE_2X
	UCSR0A |= (1 << U2X0);
	#else
	UCSR0A &= ~(1 << U2X0);
	#endif
	
	/* Asynchron, 8N1 */
	UCSR0C = (1<<UMSEL01) | (3<<UCSZ00);
	
	/* Empf�nger und Sender einschalten 
	   Empf�nger Interrupt einschalten*/
    UCSR0B = (1<<RXEN0) | (1<<TXEN0)  | (1<<RXCIE0) ;
}


static void
uart_38400(void)
{
	#undef BAUD  // avoid compiler warning
	#define BAUD 38400
	#include <util/setbaud.h>
	UBRR0H = UBRRH_VALUE;
	UBRR0L = UBRRL_VALUE;
	#if USE_2X
	UCSR0A |= (1 << U2X0);
	#else
	UCSR0A &= ~(1 << U2X0);
	#endif
	
	/* Asynchron, 8N1 */
	UCSR0C = (1<<UMSEL01) | (3<<UCSZ00);
	
	/* Empf�nger und Sender einschalten 
	   Empf�nger Interrupt einschalten*/
    UCSR0B = (1<<RXEN0) | (1<<TXEN0)  | (1<<RXCIE0) ;
}

// ============================================================================
// Zeichen ausgeben
void uart_putchar(char c)
{
	// Warten bis Buffer bereit ...
	while (!(UCSR0A & (1 << UDRE0)))
	;

	// Senden...
	UDR0 = c;
}


// String ausgeben
void uart_putstring(char *str)
{
	unsigned char i;

	for (i=0;i<255;i++) /* Maximal 255 Zeichen ausgeben ... */
	{
		if (str[i] != 0)
		uart_putchar(str[i]);
		else
		break; // Ende des Strings erreicht
	}
}

// ============================================================================
// Zeichen empfangen  (Polling)
char uart_getchar()
{
	// Ist schon ein Zeichen im Buffer?
	if (bit_is_set(UCSR0A, RXC0))
	return UDR0;
	else
	return -1;
}


// String empfangen
void uart_readline(char *str)
{
	char c;
	unsigned char index;
	
	index = 0;

	while (1)
	{
		c = uart_getchar();
		if (c != -1)
		{
			if (c == 13) /* ASCII: NewLine */
			{
				/* Ende der Zeile erreicht,
				   also String abschlie�en */
				str[index] = 0;

				/* Funktion beenden */
				return;
			}
			else /* Normales Zeichen, anh�ngen an die Zeichenkette */
			{
				str[index] = c;
				index++;
			}
		}
	}
}

// ============================================================================
// Interrupt ServiceRoutine f�r Empfang
ISR (USART0_RX_vect)
{

// Variable deklarieren
unsigned char	 NextChar ;

// Zeichen aus Empfangsregister lesen
NextChar =  UDR0 ;

// String ausgeben
uart_putstring("\r\n") ;
uart_putchar(NextChar) ;


}






#endif /* UART_232_H_ */