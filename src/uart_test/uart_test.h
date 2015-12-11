#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include "../common/uart.h"
#include "../common/rprintf.h"
//#include "../common/led.h"


#define LED_PIN 5
#define LED_PORT PORTC
#define LED_DDR DDRC



//
// Please modify the following lines. mac and ip have to be unique
// in your local area network. You can not have the same numbers in
// two devices:
static uint8_t mymac[6] = {0xa4,0x24,0x65,0x21,0x65,0x73};
// how did I get the mac addr? Translate the first 3 numbers into ascii is: TUX
//
static uint8_t otherside_www_ip[4];
// My own IP (DHCP will provide a value for it):
static uint8_t myip[4]={0,0,0,0};
// Default gateway (DHCP will provide a value for it):
static uint8_t gwip[4]={0,0,0,0};
#define TRANS_NUM_GWMAC 1
static uint8_t gwmac[6];
// Netmask (DHCP will provide a value for it):
static uint8_t netmask[4];
// packet buffer
#define BUFFER_SIZE 350
static uint8_t buf[BUFFER_SIZE+1];
	
// set output to VCC, red LED off
#define LED_ON LED_PORT |= _BV(LED_BIT)
// set output to GND, red LED on
#define LED_OFF LED_PORT &= ~(_BV(LED_BIT))
#define LED_TOGGLE LED_PORT ^= _BV(LED_BIT)


#define INIT_LED LED_DDR = _BV (LED_BIT)


#define LED_PORT PORTC          /* PORTx - register for LED output */
#define LED_BIT PC5             /* bit for button input/output */
#define LED_DDR DDRC            /* LED data direction register */
