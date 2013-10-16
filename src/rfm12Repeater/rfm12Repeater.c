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

bufferStruct buffer;

uint8_t volatile tick2 = 0;
uint8_t volatile resend2 = 0;
bufferStruct resendBuffer;


int main(void)
{
	uart_init();
	
	initCommunication();
	
	uart_putstr ("init\r\n");
	
	
	while (1)
	{
		buffer = checkReceiveData(buffer);
		//uart_putc(buffer.bufferLength);
		if(buffer.bufferLength > 0){
			resendBuffer.bufferLength = buffer.bufferLength;
			memcpy(resendBuffer.buffer, buffer.buffer, buffer.bufferLength);
			buffer.bufferLength = 0;
		}
		if(resend2){

			sendData(resendBuffer, NEED_ACK);
			resend2 = 0;
			
		}
	}
}