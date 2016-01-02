
 
#include "ir_send.h"

//
// Please modify the following lines. mac and ip have to be unique
// in your local area network. You can not have the same numbers in
// two devices:
//static uint8_t mymac[6] = {0xb4,0x28,0x95,0x23,0x60,0x23};


uint8_t second = 0;
uint8_t minute = 0;
void everyMinute(){

}
void everySecond(){
    ++second;
    if(second == 60){
        everyMinute();
        second = 0;
    }

    if(second % 6 == 0){
        dhcp_6sec_tick();
    }
}

uint16_t counter = 0;
void timerFired(){
	(void) irsnd_ISR();

	counter += 1;
	if(counter >= 15000){
		everySecond();
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

uint16_t parseString(char* string, uint8_t start, uint8_t length){
    int i = start+length-1;
    int j = 0;
    uint32_t number = 0;
    for(; i>=start; --i){
        uint16_t power = (pow(16.0, j)+0.5);
        uint8_t digit = string[i];
        if(digit >= 48 && digit <=57){
            number += power * (digit - 48);
        }
        if(digit >= 65 && digit <=70){
            number += power * (digit - 55);
        }
        if(digit >= 97 && digit <=102){
            number += power * (digit - 87);
        }
        rprintf("'%d'%d'%d'%c'%d';;", i, j, power, digit, number);
        ++j;
    }
    rprintf("parsed:'%d'%d'%d'\r\n", number, start, length);
    return number;
}

int main (void) {
    uint16_t plen;
    uint16_t dat_p;
    uint8_t rval;
    uint8_t payloadlen=0;
    IRMP_DATA irmp_data;

    INIT_LED;

    
    
    blink(100);
    blink(100);
    blink(100);
    blink(100);
    blink(100);

    uart_init();
    rprintfInit(uart_putc);
    rprintf("\r\nhello running\r\n");

    // init timer
    timer_init();
    irsnd_init();                                                           // initialize irsnd
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

    while(1) {
        plen=enc28j60PacketReceive(BUFFER_SIZE, buf);
        plen=packetloop_dhcp_renewhandler(buf,plen); // for this to work you have to call dhcp_6sec_tick() every 6 sec
        dat_p=packetloop_arp_icmp_tcp(buf,plen);
        buf[BUFFER_SIZE]='\0';

		// udp start, we listen on udp port 1200=0x4B0
        // check if ip packets are for us:
        if(eth_type_is_ip_and_my_ip(buf,plen)==0){
            // no data for me, do other tasks:
            //rprintf("no data found\r\n", plen);
            continue;
        }
        if (buf[IP_PROTO_P]==IP_PROTO_UDP_V&&buf[UDP_DST_PORT_H_P]==(listenUdpPort>>8)&&buf[UDP_DST_PORT_L_P]==(listenUdpPort&0xff)){
            payloadlen=buf[UDP_LEN_L_P]-UDP_HEADER_LEN;

            char* data = &(buf[UDP_DATA_P]);
            if(memcmp("co:", data, 3) == 0){
                rprintf("\r\nco com\r\n", plen);
            } else if(memcmp("ir:", data, 3) == 0){
                // example ir:pr=15;ad=00FF;co=1034;fl=00
                rprintf("\r\nir command: \r\n");
                rprintfStr(data);
                rprintf("\r\n");

                irmp_data.protocol = parseString(data, 6, 2);
                irmp_data.address = parseString(data, 12, 4);
                irmp_data.command = parseString(data, 20, 4);
                irmp_data.flags = parseString(data, 28, 2);

                rprintf("prot:%d, addres:%d, command:%d, flags:%d\r\n", irmp_data.protocol, irmp_data.address,
                    irmp_data.command, irmp_data.flags);

                uint8_t result = irsnd_send_data (&irmp_data, TRUE);
                rprintf("ir sending res: %d\r\n", result);
                if(result == 1){
                    blink(500);
                } else {
                    blink(100);
                    blink(100);
                    blink(100);
                }                
            } else {
               rprintf("\r\nerror no command found\r\n", plen); 
            }
            make_udp_reply_from_request(buf,data,strlen(data),listenUdpPort);
        }
    }
    return 0;
}