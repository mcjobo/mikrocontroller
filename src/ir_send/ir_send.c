
 
#include "ir_send.h"



void everySecond(){

}

uint16_t counter = 0;
void timerFired(){
	(void) irmp_ISR();

	counter += 1;
	if(counter >= 15000){
		everySecond();
        counter = 0;
		
	} else if(counter >= 30000){
		counter = 0;
	}
}

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

void get_ip_from_Dhcp(){
    uint8_t rval;
    uint16_t plen;
    rval=0;
    init_mac(mymac);
    while(rval==0){
        plen=enc28j60PacketReceive(BUFFER_SIZE, buf);
        buf[BUFFER_SIZE]='\0';
        rval=packetloop_dhcp_initial_ip_assignment(buf,plen,mymac[5]);
        rprintf("rval: %d\r\n", rval);
    }
    // we have an IP:
    dhcp_get_my_ip(myip,netmask,gwip); 
    client_ifconfig(myip,netmask);
    rprintf("myip: %d.%d.%d.%d\r\n",myip[0], myip[1], myip[2], myip[3]);

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

char strBufRprintf[50];
uint8_t pointer = 0;
void bufferFunction(unsigned char c){
	strBufRprintf[pointer] = c;
	++pointer;
}

int main (void) {

    INIT_LED;
    
    blink(100);
    blink(100);
    blink(100);
    blink(100);
    blink(100);

    uart_init(UART_BAUD_SELECT(9600,8000000));
    rprintfInit(uart_putc);
    rprintf("hello running\r\n");

    // init timer
    timer_init();
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

    get_ip_from_Dhcp();
    get_gateway_mac();

    blink(200);
    blink(200);
 	LED_ON;

    while(1) {
		
    }
    return 0;
}