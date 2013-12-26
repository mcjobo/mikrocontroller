/*
 * rfm12Repeater.c
 *
 * Created: 12.10.2013 14:59:32
 *  Author: jbolay
 */ 


#include <avr/io.h>

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <rfm12Protocol.h>
#include <timerx8.h>

bufferStruct buffer;

uint8_t volatile tick2 = 0;
uint8_t volatile resend2 = 0;
bufferStruct resendBuffer;

uint8_t timerCounter;
uint8_t nodeAddress = 10;

void timer();

int main(void)
{
	uart_init();
	initCommunication();
	timer2SetPrescaler(TIMER_CLK_DIV1024);
	timer2Init();
	
	uart_putstr ("init\r\n");
	
	while (1)
	{
		if(checkData()){
			copyBuffer(&resendBuffer, &receiveBuffer);
			receiveBuffer.bufferLength = 0;
			timerAttach(TIMER2OVERFLOW_INT, &timer);
			resetRx();
			
			uart_putstr ("received: ");
			uint8_t i;
			for (i=0;i<resendBuffer.bufferLength;i++)
			{
				uart_putc ( resendBuffer.buffer[i] );
			}
			uart_putstr ("\r\n");
		}
		if(resend2){
			uart_putstr ("repeat: ");
			uint8_t i;
			for (i=0;i<resendBuffer.bufferLength;i++)
			{
				uart_putc ( resendBuffer.buffer[i] );
			}
			uart_putstr ("\r\n");
			
			timerDetach(TIMER2OVERFLOW_INT);
			transmitData(resendBuffer);
			resend2 = 0;
		}
	}
}

void timer(){
	++timerCounter;
	if(timerCounter > 100){
		timerCounter = 0;
		resend2 = 1;
	}
}