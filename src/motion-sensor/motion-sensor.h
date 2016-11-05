#ifndef _MOTION_SENSOR_H_
#define _MOTION_SENSOR_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>
#include <stdbool.h>
#include "../common/global.h"
#include "../common/uart.h"
//#include "../common/rprintf.h"
#include "../common/led.h"
#include "../common/extint.h"
#include "../common/timerx8.h"


#define LED_STRIP_PORT PORTD
#define LED_STRIP_PIN 6
#define LED_STRIP_DDR DDRD

u08 duty = 75;
u08 timeout = 5;


const uint16_t pwm_transl[256] = {
    0,   1,   1,   1,   2,   2,   2,   2,   3,   3,   3,   4,   4,   4,   4,   5,   5,   5,   5,   6,   6,   6,   7,   7,   7, 
    7,   8,   8,   8,   9,   9,   9,   9,   10,  10,  10,  11,  11,  11,  11,  12,  12,  12,  13,  13,  13,  14,  14,  14,  14, 
    15,  15,  15,  16,  16,  16,  17,  17,  17,  18,  18,  18,  19,  19,  19,  20,  20,  20,  21,  21,  21,  22,  22,  22,  23, 
    23,  23,  24,  24,  24,  25,  25,  25,  26,  26,  27,  27,  27,  28,  28,  28,  29,  29,  30,  30,  30,  31,  31,  32,  32, 
    32,  33,  33,  34,  34,  34,  35,  35,  36,  36,  37,  37,  38,  38,  38,  39,  39,  40,  40,  41,  41,  42,  42,  43,  43, 
    44,  44,  45,  46,  46,  47,  47,  48,  48,  49,  49,  50,  51,  51,  52,  52,  53,  54,  54,  55,  56,  56,  57,  58,  58, 
    59,  60,  60,  61,  62,  63,  63,  64,  65,  66,  67,  67,  68,  69,  70,  71,  72,  73,  73,  74,  75,  76,  77,  78,  79, 
    80,  81,  82,  83,  84,  85,  87,  88,  89,  90,  91,  92,  94,  95,  96,  97,  99,  100, 101, 103, 104, 105, 107, 108, 110, 
    111, 113, 114, 116, 118, 119, 121, 123, 124, 126, 128, 130, 132, 134, 135, 137, 139, 141, 144, 146, 148, 150, 152, 155, 157, 
    159, 162, 164, 167, 169, 172, 174, 177, 180, 183, 185, 188, 191, 194, 197, 200, 204, 207, 210, 214, 217, 221, 224, 228, 231, 
    235, 239, 243, 247, 251, 255};



#endif // _MOTION_SENSOR_H_