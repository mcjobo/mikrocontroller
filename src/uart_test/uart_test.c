
 
#include "uart_test.h"

//
// Please modify the following lines. mac and ip have to be unique
// in your local area network. You can not have the same numbers in
// two devices:
//static uint8_t mymac[6] = {0xb4,0x28,0x95,0x23,0x60,0x23};






void blink(uint16_t time){
    uint16_t count = time;
    LED_ON;
    while(count--) {
        _delay_ms(1);
    }
    count = time;
    LED_OFF;
    while(count--) {
        _delay_ms(1);
    }
}


char strBufRprintf[50];
uint8_t pointer = 0;
void bufferFunction(unsigned char c){
	strBufRprintf[pointer] = c;
	++pointer;
}

uint16_t parseString(char* string, uint8_t start, uint8_t length){
    char buf[5];
    memcpy( buf, &string[start], length );
    uint16_t number = atoi(buf);
    //rprintfStr(buf);rprintfCRLF();
    //rprintf("parsed:'%d'%d'%d'\r\n", number, start, length);
    return number;
}

int main (void) {


    INIT_LED;

    
    
    blink(100);
    blink(100);
    blink(100);
    blink(100);
    blink(100);

    uart_init();
    rprintfInit(uart_putc);
    rprintf("\r\nhello running\r\n");

 
    sei();

 
    while(1) {
        rprintf("\r\nhello running2\r\n");
  
        
    }
    return 0;
}