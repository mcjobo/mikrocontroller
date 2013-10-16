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


bufferStruct buffer;

uint8_t volatile tick2 = 0;
uint8_t volatile resend2 = 0;
bufferStruct resendBuffer;

int main(void)
{
	uart_init();

	uint8_t teststring[] = "asd12";
	uint8_t packetLength = sizeof(teststring);
	
	initCommunication();
	sei();

	uart_putstr ("init\r\n");
	
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
}