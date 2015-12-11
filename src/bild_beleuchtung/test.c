#include "bild_beleuchtung.h"






int main(void)
{
    uint8_t loop = 0;

    // delay 1s to avoid further communication with uart or RFM12 when my programmer resets the MC after 500ms...
    _delay_ms(1000);



    //uart_init(UART_BAUD_SELECT(9600,8000000));
    uart_init();
    rprintfInit(uart_putc);
    led_blink(100, 100, 3);
    sei();

    rprintf ("\r\n");
    rprintf("Bild Beleuchtung RGB Dimmer\r\n");
    

    
    //set_animation_fixed_color(0);
    






    led_blink(500, 0, 1);



    while (42)
    {


    }
}