/*
 * timer.h
 *
 * Created: 27.09.2013 13:50:34
 *  Author: jbolay
 */ 


#ifndef TIMER_H_
#define TIMER_H_

#include <avr/io.h>
#include <avr/interrupt.h>

void startTimer(uint16_t miliseconds, void (*functionPtr)());



#endif /* TIMER_H_ */