/* Alle Zeichen zwischen Schrägstrich-Stern 
   und Stern-Schrägstrich sind Kommentare */
 
// Zeilenkommentare sind ebenfalls möglich
// alle auf die beiden Schrägstriche folgenden
// Zeichen einer Zeile sind Kommentar
 
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <string.h>
#include "uart.h"
#include "rprintf.h"
#include "ip_arp_udp_tcp.h"
#include "enc28j60.h"
#include "timeout.h"
#include "net.h"
#include "dhcp_client.h"
#include "irmp.h"
#include "timerx8.h"

uint8_t dstip[4]={192,168,2,50};


//
// Please modify the following lines. mac and ip have to be unique
// in your local area network. You can not have the same numbers in
// two devices:
// beaware not to use a 1 as first bit (like have 0x00 as first)
static uint8_t mymac[6] = {0x00,0x38,0x94,0x13,0x50,0x55};
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
static char urlvarstr[30];
static volatile uint8_t sec=0; // counts up to 6 and goes back to zero
static volatile uint8_t gsec=0; // counts up beyond 6 sec


// set output to VCC, red LED off
#define LED_ON LED_PORT |= _BV(LED_BIT)
// set output to GND, red LED on
#define LED_OFF LED_PORT &= ~(_BV(LED_BIT))
#define LED_TOGGLE LED_PORT ^= _BV(LED_BIT)
#define INIT_LED LED_DDR = _BV (LED_BIT)
#define LED_PORT PORTC          /* PORTx - register for LED output */
#define LED_BIT PC4             /* bit for button input/output */
#define LED_DDR DDRC            /* LED data direction register */


// packet buffer
#define BUFFER_SIZE 350
static uint8_t buf[BUFFER_SIZE+1];
static uint8_t start_web_client=0;
static uint8_t web_client_attempts=0;
static int8_t dns_state=0;

uint16_t counter = 0;

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

void timerFired(){
	(void) irmp_ISR();

	counter += 1;
	if(counter >= 15000){

		
	} else if(counter >= 30000){
		counter = 0;
	}
}


void timer_init(){
	timer1CTCInit((F_CPU / F_INTERRUPTS) - 1);
	timer1SetPrescaler(TIMER_CLK_DIV1);
	timerAttach(TIMER1OUTCOMPAREA_INT, timerFired);
}

// the __attribute__((unused)) is a gcc compiler directive to avoid warnings about unsed variables.
void arpresolver_result_callback(uint8_t *ip __attribute__((unused)),uint8_t reference_number,uint8_t *mac){
    uint8_t i=0;
    if (reference_number==TRANS_NUM_GWMAC){
        // copy mac address over:
        while(i<6){gwmac[i]=mac[i];i++;}
    }
}




char strBufRprintf[50];
uint8_t pointer = 0;
void bufferFunction(char c){
	strBufRprintf[pointer] = c;
	++pointer;
}

void clearBuffer(){
    uint8_t i;
    for(; i<50;++i){
        strBufRprintf[i]=0;
    }
    pointer = 0;
}


void get_ip_from_Dhcp(){

    uint8_t rval;
    uint16_t plen;
    rval=0;
    init_mac(mymac);
    
    rprintf("dhcp stuff: %d\n", enc28j60linkup());
    uart_putstr(strBufRprintf);
    
    while(rval==0){
        plen=enc28j60PacketReceive(BUFFER_SIZE, buf);
        buf[BUFFER_SIZE]='\0';

        if(plen > 0){
            rprintf("dhcp payload length: %d udp port: %d message type %d id_1 %d id_2 %d\n", plen, buf[UDP_SRC_PORT_L_P], buf[UDP_DATA_P], buf[UDP_DATA_P+5], buf[UDP_DATA_P+6]);
            uart_putstr(strBufRprintf);
        }   

        rval=packetloop_dhcp_initial_ip_assignment(buf,plen,mymac[5]);
    }
    // we have an IP:
    dhcp_get_my_ip(myip,netmask,gwip); 
    client_ifconfig(myip,netmask);
    rprintf("myip: %d.%d.%d.%d\r\n",myip[0], myip[1], myip[2], myip[3]);
    //rprintf("gwip: %d.%d.%d.%d\r\n",gwip[0], gwip[1], gwip[2], gwip[3]);
    blink(1000);

    if (gwip[0]==0){
        // we must have a gateway returned from the dhcp server
        // otherwise this code will not work
        uart_putc('g');
        while(1); // stop here
    }
}
 
void get_gateway_mac(){
    uint16_t plen;
    // we have a gateway.
    // find the mac address of the gateway (e.g your dsl router).
    get_mac_with_arp(gwip,TRANS_NUM_GWMAC,&arpresolver_result_callback);
    while(get_mac_with_arp_wait()){
        // to process the ARP reply we must call the packetloop
        plen=enc28j60PacketReceive(BUFFER_SIZE, buf);
        packetloop_arp_icmp_tcp(buf,plen);
    }
}


int main (void) {
 
 	uart_init();
    timer_init();
 	rprintfInit(bufferFunction); 	
    sei();
    rprintf("hello world\n");
    uart_putstr(strBufRprintf);

 	INIT_LED;

    blink(100);
    blink(100);
    blink(100);
    blink(100);
    blink(100);


    /*initialize enc28j60*/
    enc28j60Init(mymac);
    _delay_loop_1(0); // 60us
    
	sei();

	/* Magjack leds configuration, see enc28j60 datasheet, page 11 */
    // LEDB=yellow LEDA=green
    //
    // 0x476 is PHLCON LEDA=links status, LEDB=receive/transmit
    // enc28j60PhyWrite(PHLCON,0b0000 0100 0111 01 10);
    enc28j60PhyWrite(PHLCON,0x476);

rprintf("before dhcp\n");
    uart_putstr(strBufRprintf);
    // DHCP handling. Get the initial IP
    get_ip_from_Dhcp();   
    rprintf("after dhcp\n");
    uart_putstr(strBufRprintf); 
    get_gateway_mac();

    // send_udp sends via a given gateway. The dstmac is the MAC of the gateway (note this replaces the client_set_gwip() function of previous versions)
	//extern void send_udp(uint8_t *buf,char *data,uint8_t datalen,uint16_t sport, const uint8_t *dip, uint16_t dport,const uint8_t *dstmac);



	IRMP_DATA   irmp_data;
	irmp_init();

	//char strBuf[50];
	//char buf1[4] = "";

	uart_putstr(strBufRprintf);
    pointer = 0;
    blink(200);
    blink(200);
    clearBuffer();
    while(1) {
		

        if (irmp_get_data (&irmp_data))
        {
            rprintf("prot:%x;addr:%x;com:%x;flags:%x\n", irmp_data.protocol, irmp_data.address, irmp_data.command, irmp_data.flags);
            send_udp(buf, strBufRprintf, 50, 7001, dstip, 5000, gwmac);
            uart_putstr(strBufRprintf);
            clearBuffer();
            blink(200);
        }
   }  
   return 0;
}