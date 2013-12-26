/*
* rfm12Sender.c
*
* Created: 12.10.2013 14:59:11
*  Author: jbolay
*/


#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/delay.h>

#include <rfm12.h>
#include <rfm12Protocol.h>
#include <uart2.h>
#include <timerx8.h>


bufferStruct buffer;
uint8_t volatile tick2 = 0;
uint8_t volatile sending = 1;
bufferStruct resendBuffer;
char bufChar[4];
uint8_t nodeAddress = 5;

uint8_t timerCounter;
void timer();

int main(void)
{
	uart_init();

	uint8_t number = 1;
	//uint8_t number[] = "asd12";
	//uint8_t packetLength = sizeof(number);
	uint8_t packetLength = 6;
	
	initCommunication();
	timer2SetPrescaler(TIMER_CLK_DIV1024);
	timer2Init();
	sei();

	uart_putstr ("reset: ");
	uart_putstr(itoa(MCUSR, bufChar, 16));
	MCUSR = 0;
	uart_putstr ("\r\n");
	
	bufferStruct send;
	send.bufferLength = packetLength;
	
	
	while (1)
	{
		if(checkData()){
			copyBuffer(&resendBuffer, &receiveBuffer);
			receiveBuffer.bufferLength = 0;
			resetRx();
			
			uart_putstr ("received: ");
			uint8_t i;
			for (i=0;i<resendBuffer.bufferLength;i++)
			{
				uart_putc ( resendBuffer.buffer[i] );
			}
			uart_putstr ("\r\n");
			
			uint8_t received = atoi(resendBuffer.buffer);
			if(number == received){
				++number;
				timerAttach(TIMER2OVERFLOW_INT, &timer);
			}
		}
		
		if(sending){
			sending = 0;
			timerDetach(TIMER2OVERFLOW_INT);
			char* buffer = itoa(number, bufChar, 10);
			uint8_t size = sizeof(buffer);
			
			uart_putstr ("send: ");
			uart_putstr (buffer);
			uart_putstr ("\r\n");
			memcpy(send.buffer, buffer, size);
			send.ackState = NEED_ACK;
			send.address = 10;
			send.bufferLength = size;
			send.type = SEND_DATA;
			uint8_t sended = transmitData(send);
			if(sended){
				uart_putstr ("sended\r\n");
			} else {
				uart_putstr ("not sended\r\n");
			}			
		} 
	}
}

void timer(){
	++timerCounter;
	if(timerCounter > 100){
		timerCounter = 0;
		sending = 1;
	}
}