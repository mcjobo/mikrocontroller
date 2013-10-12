/*
 * rfm12_dev.c
 *
 * Created: 17.08.2013 23:36:58
 *  Author: jbolay
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "protocol.h"
#include "protStatemachine.h"

bufferStruct buffer;

uint8_t volatile tick2 = 0;
uint8_t volatile resend2 = 0;
bufferStruct resendBuffer;

// main for reply received data
ISR (TIMER2_COMPA_vect){
	uart_putc('I');
	++tick2;
	uart_putc('I');
	if(tick2 >= 10){
		uart_putc('S');
		resend2 = 1;
		tick2 = 0;
	}
}
void stopTimer2(){
	uart_putc('T');
	//TIMSK2 &= ~(1<<OCIE2A);
}

void startTimer2(){
	uart_putc('S');
	TCCR2A = (1<<WGM01); // CTC Modus
	TCCR2B |= (1<<CS02)|(1<<CS00); // Prescaler 1024
	OCR2A = 48-1;
	
	// Compare Interrupt erlauben
	TIMSK2 |= (1<<OCIE2A);
	
	// Global Interrupts aktivieren
	sei();
}

int main(void)
{
	uart_init();
	//_delay_ms(500);
	uint8_t teststring[] = "ich liebe dich";
	uint8_t packettype = 0xEE;
	initCommunication();
	
	uart_putstr ("init\r\n");
	
	startTimer2();
	
	
	while (1)
	{
		buffer = checkReceiveData(buffer);
		//uart_putc(buffer.bufferLength);
		if(buffer.bufferLength > 0){
			resendBuffer.bufferLength = buffer.bufferLength;
			memcpy(resendBuffer.buffer, buffer.buffer, buffer.bufferLength);
			buffer.bufferLength = 0;
			startTimer2();		
			uart_putc('S');	
		}
		if(resend2){
			uart_putc('S');	
			stopTimer2();
			sendData(resendBuffer, NEED_ACK);
			resend2 = 0;
			
		}
	}
}


// main for sending data and sending new data
/*
int main(void)
{
	uart_init();
	//_delay_ms(500);
	uint8_t teststring[] = "asd12";
	uint8_t packetLength = sizeof(teststring);
	initCommunication();
	uart_putstr ("init\r\n");

	rfm12_rx_clear();
	//rfm12_tx (sizeof(teststring), teststring);
		
	uint16_t counter = 20000;
	
	bufferStruct send;
	send.bufferLength = packetLength;
	memcpy(send.buffer, teststring, send.bufferLength);
	sendData(send, NEED_ACK);
	while (1)
	{		
		checkReceiveData(buffer);
		if(buffer.bufferLength > 0){
			uint8_t i;
			uart_putstr ("new packet:\r\n");
			// dump buffer contents to uart
			uint8_t* payload = getPayload(buffer.bufferLength, buffer.buffer);
			for (i=0;i<getPayloadLength(buffer.bufferLength, buffer.buffer);i++)
			{
				uart_putc ( payload[i] );
			}
			uart_putstr ("\r\n");
			buffer.bufferLength = 0;
		}			

		--counter;
	}
}*/
