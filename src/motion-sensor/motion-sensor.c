
#include "motion-sensor.h"


u08 timerCount = 0;
u32 timerSeconds = 600;
u32 motionSensed = 0;

void timerCounter()
{
    timerCount += 1;
    if(timerCount == 12)
    {
        timerCount = 0;
        ++timerSeconds;
        //do something
    }
}

void init_ledstrip()
{
    sbi(LED_STRIP_DDR, LED_STRIP_PIN);
}

void handleInt()
{
    motionSensed = timerSeconds;
    led_blink(10, 10, 1);
}


void setPWM(u08 dutyCycle)
{
    u16 run;
    //if(dutyCycle > 100){
    //    dutyCycle = 100;
    //}
    run = dutyCycle * 255 / 100;
    run = pwm_transl[run];
    
    if(run == 0)
    {
        timer0PWMAOff(); 
        cbi(PORTD, PD6);
    }
    else
    {
        timer0PWMAOn();
        timer0PWMASet(run);
        //timer0PWMASet(pwm_transl[duty]);    
    }
}

void esp8266()
{
    //uart_init();
    //rprintfInit((void (*)(unsigned char))uart_putc);
    //rprintf("AT");
}

int main(void)
{
    led_init();
    led_blink(300, 300, 2);

    init_ledstrip();

    extintInit();
    extintConfigure(EXTINT0, EXTINT_EDGE_ANY);
    extintConfigure(EXTINT1, EXTINT_EDGE_ANY);
    extintAttach(EXTINT0, handleInt);
    extintAttach(EXTINT1, handleInt);

    timer0PWMInit();
    timer0PWMAOn(); 

    timer1Init();
    timer1SetPrescaler(TIMER_CLK_DIV8);
    timer1CTCInit(10000);
    timerAttach(TIMER1OUTCOMPAREA_INT, timerCounter);

    esp8266();

    sei();

    while(1)
    {
        if(motionSensed + timeout >= timerSeconds)
        {
            setPWM(duty);
        }
        else 
        {
            setPWM(0);
        }
        
        //nothing to do yet
    }
}