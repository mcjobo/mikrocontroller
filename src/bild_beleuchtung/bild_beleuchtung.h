#ifndef _BILD_BELEUCHTUNG_H_
#define _BILD_BELEUCHTUNG_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>
#include <stdbool.h>
#include "../common/uart.h"
#include "../common/rprintf.h"
#include "../common/led.h"


#define RGBLED_DDR DDRD
#define RGBLED_PORT PORTD
#define RGBLED_PINPORT PIND

#define RED_PIN 6
#define GRN_PIN 5
#define BLU_PIN 1

#define RED_DDR DDRD
#define GRN_DDR DDRD
#define BLU_DDR DDRB

#define LED_PIN 7
#define LED_PORT PORTD
#define LED_DDR DDRD



uint8_t brightness_factor;            // fixed, from e2p
uint8_t user_brightness_factor = 100; // additional brightness changeable by brightness message



// For the given 5 bit animation time, these are the lengths in timer 2 cycles.
// The input value x means 0.05s * 1.3 ^ x and covers 30ms to 170s. Each timer cycle is 32.768ms.
// Therefore, the values are: round((0.05s * 1.3 ^ x) / 0.032768s).
// Animation time 0 is animation OFF, so there are 31 defined animation times.
const uint16_t timer_cycles[31] = {1, 2, 3, 4, 6, 8, 10, 12, 16, 21, 27, 36, 46, 60,
                                  78, 102, 132, 172, 223, 290, 377, 490, 637, 828,
                                  1077, 1400, 1820, 2366, 3075, 3998, 5197};

const uint16_t pwm_transl[256] = {
    0, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 7, 7, 7, 7,
    8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 13, 13, 13, 14, 14,
    14, 14, 15, 15, 15, 16, 16, 16, 17, 17, 17, 18, 18, 18, 19, 19, 19, 20, 20, 20,
    21, 21, 21, 22, 22, 22, 23, 23, 23, 24, 24, 24, 25, 25, 25, 26, 26, 27, 27, 27,
    28, 28, 28, 29, 29, 30, 30, 30, 31, 31, 32, 32, 32, 33, 33, 34, 34, 34, 35, 35,
    36, 36, 37, 37, 38, 38, 38, 39, 39, 40, 40, 41, 41, 42, 42, 43, 43, 44, 44, 45,
    46, 46, 47, 47, 48, 48, 49, 49, 50, 51, 51, 52, 52, 53, 54, 54, 55, 56, 56, 57,
    58, 58, 59, 60, 60, 61, 62, 63, 63, 64, 65, 66, 67, 67, 68, 69, 70, 71, 72, 73,
    73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 87, 88, 89, 90, 91, 92, 94,
    95, 96, 97, 99, 100, 101, 103, 104, 105, 107, 108, 110, 111, 113, 114, 116, 118,
    119, 121, 123, 124, 126, 128, 130, 132, 134, 135, 137, 139, 141, 144, 146, 148,
    150, 152, 155, 157, 159, 162, 164, 167, 169, 172, 174, 177, 180, 183, 185, 188,
    191, 194, 197, 200, 204, 207, 210, 214, 217, 221, 224, 228, 231, 235, 239, 243,
    247, 251, 255};

struct rgb_color_t
{
    uint8_t r;
    uint8_t g;
    uint8_t b;
};

#define ANIM_COL_MAX 31
struct rgb_color_t anim_col[ANIM_COL_MAX]; // The last active color (index 0) + colors used for the animation
struct rgb_color_t current_col;            // The current (mixed) color calculated within an animation.
uint8_t anim_time[ANIM_COL_MAX];           // The times used for animate blending between two colors.
                                           // 0 at pos x indicates the last color used is x-1.
uint8_t anim_col_i[10];    // The 10 (indexed) colors used for the animation.
uint8_t repeat;            // Number of repeats, 0 = endless.
bool autoreverse;          // Play back animation in reverse order when finished.
uint16_t step_len = 0;     // length of animation step of current color to next color.
uint16_t step_pos = 0;     // Position in the current animation step.
uint8_t col_pos = 0;       // Index of currently animated color.
uint8_t rfirst;            // When a repeat loop active, where does a cycle start (depends on autoreverse switch).
uint8_t rlast;             // When a repeat loop active, where does a cycle end (depends on repeat count).
uint8_t llast;             // In the last cycle, where does it end (depends on repeat count).
bool single_channel = false;
uint8_t basic_anim_time = 20;

#endif // _BILD_BELEUCHTUNG_H_