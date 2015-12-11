/*
* This file is part of smarthomatic, http://www.smarthomatic.org.
* Copyright (c) 2014 Uwe Freese
*
* smarthomatic is free software: you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation, either version 3 of the License, or (at your
* option) any later version.
*
* smarthomatic is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with smarthomatic. If not, see <http://www.gnu.org/licenses/>.
*/

#include "bild_beleuchtung.h"

// Timer0 (8 Bit) and Timer1 (10 Bit in 8 Bit mode) are used for the PWM output for the LEDs.
// Read for more information about PWM:
// http://www.protostack.com/blog/2011/06/atmega168a-pulse-width-modulation-pwm/
// http://extremeelectronics.co.in/avr-tutorials/pwm-signal-generation-by-using-avr-timers-part-ii/
void PWM_init(void)
{
    // Enable output pins
    RED_DDR |= (1 << RED_PIN);
    GRN_DDR |= (1 << GRN_PIN);
    BLU_DDR |= (1 << BLU_PIN);

    // OC0A (Red LED): Phase correct PWM, 8 Bit, TOP = 0xFF = 255, non-inverting output
    // OC0B (Green LED): Phase correct PWM, 8 Bit, TOP = 0xFF = 255, non-inverting output
    TCCR0A = (1 << WGM00) | (1 << COM0A1) | (1 << COM0B1);

    // OC1A (Blue LED): Phase correct PWM, 8 Bit, TOP = 0xFF = 255, non-inverting output
    TCCR1A = (1 << WGM10) | (1 << COM1A1);

    // Clock source for both timers = I/O clock, 1/64 prescaler -> ~ 240 Hz
    TCCR0B = (1 << CS01) | (1 << CS00);
    TCCR1B = (1 << CS11) | (1 << CS10);
}

// Timer2 (8 Bit) is used for accurate counting of the animation time.
void timer2_init(void)
{
    // Clock source = I/O clock, 1/1024 prescaler
    TCCR2B = (1 << CS22) | (1 << CS21) | (1 << CS20);

    // Timer/Counter2 Overflow Interrupt Enable
    TIMSK2 = (1 << TOIE2);
}



void set_RGB_PWM(struct rgb_color_t color)
{
    OCR0A = (uint32_t)(pwm_transl[color.r]) * brightness_factor * user_brightness_factor / 10000;
    OCR0B = (uint32_t)(pwm_transl[color.g]) * brightness_factor * user_brightness_factor / 10000;
    OCR1A = (uint32_t)(pwm_transl[color.b]) * brightness_factor * user_brightness_factor / 10000;
}

// Calculate an RGB value out of the index color.
// The color palette is 6 bit with 2 bits per color (same as EGA).
// Bit 1+0 = blue
// Bit 3+2 = green
// Bit 5+4 = red
// The brightness per color can be:
// 0 -> 0
// 1 -> 85
// 2 -> 170
// 3 -> 255
struct rgb_color_t index2color(uint8_t color)
{
    struct rgb_color_t res;
    
    res.r = ((color & 0b110000) >> 4) * 85;
    res.g = ((color & 0b001100) >> 2) * 85;
    res.b = ((color & 0b000011) >> 0) * 85;
    
    rprintf("Index %d to color -> %d,%d,%d\r\n", color, res.r, res.g, res.b);
    
    return res;
}

// Calculate the color that has to be shown according to the animation settings and counters.
// Save the color as currently active color in current_col.
void update_current_col(void)
{
    if (step_len != 0) // animation running
    {
        current_col.r = (uint8_t)((uint32_t)anim_col[col_pos].r * (step_len - step_pos) / step_len
            + (uint32_t)anim_col[col_pos + 1].r * step_pos / step_len);
        current_col.g = (uint8_t)((uint32_t)anim_col[col_pos].g * (step_len - step_pos) / step_len
            + (uint32_t)anim_col[col_pos + 1].g * step_pos / step_len);
        current_col.b = (uint8_t)((uint32_t)anim_col[col_pos].b * (step_len - step_pos) / step_len
            + (uint32_t)anim_col[col_pos + 1].b * step_pos / step_len);
    }

    rprintf("col_pos %d, step_len %d\r\n", col_pos, step_len,step_len);
    rprintf("PWM %d,%d,%d\r\n", current_col.r, current_col.g, current_col.b);
    
    set_RGB_PWM(current_col);
}

// Count up the animation_position every 1/8000000 * 1024 * 256 ms = 32.768 ms,
// if animation is running.
ISR (TIMER2_OVF_vect)
{
    if (step_len == 0) // no animation running
    {
        return;
    }
    
    if (step_pos < step_len)
    {
        step_pos++;
    }
    else
    {
        rprintf("-- Anim step %d (color pos %d -> %d) finished.\r\n", col_pos, col_pos, col_pos + 1);

        // When animation step at rlast is completed (col_pos = rlast) and
        // repeat != 1, decrease repeat by 1 (if not 0 already) and jump to rfirst.
        if ((repeat != 1) && (col_pos == rlast))
        {
            col_pos++;

            if (repeat > 1)
                    repeat--;

            rprintf("-- More cycles to go. New repeat = %d. Reset col_pos to %d.\r\n", repeat, rfirst);
            
            col_pos = rfirst;
            step_pos = 0;
            step_len = timer_cycles[anim_time[col_pos]];
        }
        // When animation step at llast is completed (col_pos = llast) and
        // repeat = 1, stop animation.
        else if ((repeat == 1)  && (col_pos == llast))
        {
            rprintf("-- End of animation. Set fixed color %d\r\n", col_pos + 1);
            set_RGB_PWM(anim_col[col_pos + 1]); // set color last time
            step_len = 0;
            return;
        }
        else // Within animation -> go to next color
        {
            col_pos++;
            step_pos = 0;
            step_len = timer_cycles[anim_time[col_pos]];
            
            rprintf("--- Go to next color, new col_pos: %d. new step_len: %d\r\n", col_pos, step_len);
        }
    }
    
    update_current_col();
}

void set_animation_fixed_color(uint8_t color_index)
{
    cli();

    step_len = 0;
    current_col = index2color(color_index);
    anim_col_i[0] = color_index;
    anim_col[0] = current_col;

    rprintf("Set color nr. %d\r\n", color_index);
    update_current_col();
    
    sei();
}





void copy_reverse(uint8_t from, uint8_t to, uint8_t count)
{
    int8_t i;
    
    rprintf("Copy rev from %d to %d count %d\r\n", from, to, count);
    
    for (i = 0; i < count; i++)
    {
        anim_col[to + count - 1 - i] = anim_col[from + i];
        anim_time[to + count - 1 - i] = anim_time[from + i - 1];
    }
}

void copy_forward(uint8_t from, uint8_t to, uint8_t count)
{
    int8_t i;
    
    rprintf("Copy fwd from %d to %d count %d\r\n", from, to, count);
    
    // copy in reverse direction because of overlapping range in scenario #4 "autoreverse = 0, repeat > 1"
    for (i = count - 1; i >= 0; i--)
    {
        anim_col[to + i] = anim_col[from + i];
        anim_time[to + i] = anim_time[from + i];
    }
}

// Set the RGB color values to play back according to the indexed colors.
// "Unfold" the colors to a linear animation only playing forward when
// autoreverse is set.
void init_animation(void)
{
    uint8_t key_idx = 10; // Marker for calculating how the values are copied (see doc).
    uint8_t i;
    
    // Transfer initial data to RGB array, shifted by 1.
    for (i = 0; i < 10; i++)
    {
        anim_col[i + 1] = index2color(anim_col_i[i]);
    }

    anim_col[0] = current_col;
    
    // Find key_idx
    for (i = 0; i < 10; i++)
    {
        if (anim_time[i] == 0)
        {
            key_idx = i;
            break;
        }
    }
    
    // calc rfirst
    rfirst = autoreverse && (repeat % 2 == 1) ? key_idx - 1 : 2;
    
    // Copy data and set rlast and llast according "doc/initialization.png".
    if (autoreverse && (repeat != 1))
    {
        if (repeat == 0) // infinite cycles (picture #3)
        {
            copy_reverse(2, key_idx, key_idx - 1);
            rlast = llast = 2 * key_idx - 3;
        }
        else if (repeat % 2 == 0) // even number of cycles (picture #2)
        {
            uint8_t tmp_time = anim_time[key_idx - 1];
            copy_forward(key_idx, 2 * key_idx - 3, 1);
            copy_reverse(2, key_idx - 1, key_idx - 2);
            anim_time[2 * key_idx - 4] = tmp_time;
            rlast = 2 * key_idx - 5;
            llast = 2 * key_idx - 4;
            repeat /= 2;
        }
        else // odd number of cycles (picture #1)
        {
            copy_forward(2, 2 * key_idx - 4, key_idx - 1);
            copy_reverse(3, key_idx - 1, key_idx - 3);
            rlast = 3 * key_idx - 8;
            llast = 3 * key_idx - 7;
            repeat /= 2;
        }
    }
    else
    {
        if (repeat == 0) // infinite cycles (picture #5)
        {
            copy_forward(2, key_idx + 1, 1);
            rlast = llast = key_idx;
            anim_time[key_idx] = anim_time[1];
        }
        else if (repeat == 1) // one cycle (picture #6)
        {
            rlast = llast = key_idx - 1;
        }
        else // 2 cycles or more (picture #4)
        {
            copy_forward(2, key_idx, key_idx - 1);
            anim_time[key_idx - 1] = anim_time[1];
            rlast = key_idx - 1;
            llast = 2 * key_idx - 3;
            repeat--;
        }
    }
    
    rprintf("key_idx: %d\r\n", key_idx);
    rprintf("rfirst: %d\r\n", rfirst);
    rprintf("rlast: %d\r\n", rlast);
    rprintf("llast: %d\r\n", llast); 
}

void clear_anim_data(void)
{
    uint8_t i;
    
    for (i = 0; i < ANIM_COL_MAX; i++)
    {
        anim_time[i] = 0;
    }
}

// Print out the animation parameters, indexed colors used in the "Set"/"SetGet" message and the
// calculated RGB colors.
// Only for debugging purposes!
void dump_animation_values(void)
{
    uint8_t i;
    
    rprintf("Animation repeat: %d, autoreverse: %s, ",
        repeat, autoreverse ? "ON" : "OFF");
    rprintf("Current color: RGB %3d,%3d,%3d\r\n", current_col.r, current_col.g, current_col.b);

    rprintf("rfirst: %d, rlast: %d, llast: %d\r\n",
        rfirst, rlast, llast);

    for (i = 0; i < ANIM_COL_MAX; i++)
    {
        rprintf("Pos %02d: color ", i);
    
        if (i < 10)
        {
            rprintf("%02d   ", anim_col_i[i]);
        }
        else
        {
            rprintf("--   ");
        }

        rprintf("RGB %3d,%3d,%3d", anim_col[i].r, anim_col[i].g, anim_col[i].b);
        
        rprintf("   time %02d\r\n", anim_time[i]);
    }

    rprintf("\r\n");
}

// Function to test the calculation of animation colors.
// Call it at the beginning of the main function for debugging.
void test_anim_calculation(void)
{
    // change repeat and autoreverse to check the different scenarios
    repeat = 0;
    autoreverse = true;
    
    step_pos = 0;
    col_pos = 0;
            
    anim_time[0] = 10;
    anim_col_i[0] = 0;
    anim_time[1] = 16;
    anim_col_i[1] = 48;
    anim_time[2] = 16;
    anim_col_i[2] = 12;
    anim_time[3] = 16;
    anim_col_i[3] = 3;
    anim_time[4] = 15;
    anim_col_i[4] = 51;
    anim_time[5] = 9;
    anim_col_i[5] = 1;

    rprintf("\r\n*** Initial colors ***\r\n");
    dump_animation_values();
    
    init_animation();
    
    rprintf("\r\n*** Colors after initialisation ***\r\n");
    dump_animation_values();
    
    step_len = timer_cycles[anim_time[0]];

    while (42) {}
}




int main(void)
{
    uint8_t loop = 0;

    // delay 1s to avoid further communication with uart or RFM12 when my programmer resets the MC after 500ms...
    _delay_ms(1000);



    //uart_init(UART_BAUD_SELECT(9600,8000000));
    uart_init();
    rprintfInit(uart_putc);
    led_init();
    led_blink(100, 100, 3);
    sei();

    rprintf ("\r\n");
    rprintf("Bild Beleuchtung RGB Dimmer\r\n");
    
    PWM_init();
    
    set_animation_fixed_color(63);
    //set_animation_fixed_color(0);
    
    timer2_init();

    clear_anim_data();


    // test_anim_calculation(); // for debugging only
    // Show colors shortly to tell user that power is connected (status LED may not be visible).
    // In parallel, let status LED blink 3 times (as usual for SHC devices).
    current_col = index2color(48);
    set_RGB_PWM(current_col);
    led_switch(true);
    _delay_ms(500);
    current_col = index2color(12);
    set_RGB_PWM(current_col);
    led_switch(false);
    _delay_ms(500);
    current_col = index2color(3);
    set_RGB_PWM(current_col);
    led_switch(true);
    _delay_ms(500);
    current_col = index2color(0);
    set_RGB_PWM(current_col);
    led_switch(false);
    _delay_ms(500);

    led_blink(500, 0, 1);

    cli();
            
    brightness_factor = 10;
    repeat = 0;
    autoreverse = true;
    step_pos = 0;
    col_pos = 0;
    anim_col[0] = current_col;
    
    rprintf("Repeat:%u;AutoReverse:%u;", repeat, autoreverse);
    

    step_len = 10;
    anim_time[0] = basic_anim_time;
    anim_col_i[0] = 0;
    anim_time[1] = basic_anim_time;
    anim_col_i[1] = 7;
    anim_time[2] = basic_anim_time;
    anim_col_i[2] = 14;
    anim_time[3] = basic_anim_time;
    anim_col_i[3] = 21;
    anim_time[4] = basic_anim_time;
    anim_col_i[4] = 28;
    anim_time[5] = basic_anim_time;
    anim_col_i[5] = 35;
    anim_time[6] = basic_anim_time;
    anim_col_i[6] = 42;
    anim_time[7] = basic_anim_time;
    anim_col_i[7] = 49;
    anim_time[8] = basic_anim_time;
    anim_col_i[8] = 56;
    anim_time[9] = basic_anim_time;
    anim_col_i[9] = 63;
    
    init_animation();
    step_len = timer_cycles[anim_time[0]];
    update_current_col();
    
    sei();

    while (42)
    {

        if (loop == 50)
        {
            loop = 0;
            led_blink(200, 0, 1);
        }
        else
        {
            _delay_ms(20);
        }

        loop++;
    }
}
