#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <string.h>
#include <avr/eeprom.h>
#include "ip_config.h"
#include "../common/uart.h"
#include "../common/rprintf.h"
#include "../common/ip_arp_udp_tcp.h"
#include "../common/enc28j60.h"
#include "../common/timeout.h"
#include "../common/net.h"
#include "../common/dhcp_client.h"
#include "../common/irsnd.h"
#include "../common/timerx8.h"

uint8_t dstip[4]={192,168,100,125};
// listen port for udp
uint16_t  listenUdpPort = 6500;



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
