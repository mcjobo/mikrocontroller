/*
 * rfm12.c
 *
 * Created: 22.08.2013 20:55:32
 *  Author: jbolay
 */ 

#include "rfm12.h"

//! Global control and status.
rfm12_control_t ctrl;

//! Buffer and status for packet transmission.
rf_tx_buffer_t rf_tx_buffer;

//! Buffers and status to receive packets.
rf_rx_buffer_t rf_rx_buffers[2];

uint8_t volatile rx_status;

uint16_t  rfm12_read(uint16_t c)
{
	uint16_t retval;
	SS_ASSERT();
	
	SPDR = c>>8;
	while(!(SPSR & (1<<SPIF)));
	retval = SPDR<<8;
	SPDR = c & 0xff;
	while(!(SPSR & (1<<SPIF)));
	retval |= SPDR;

	SS_RELEASE();
	return retval;
}

void rfm12_init(void)
{
	//initialize spi
	SS_RELEASE();
	DDR_SS |= (1<<BIT_SS);
	spi_init();

	//enable internal data register and fifo
	//setup selected band
	rfm12_data(RFM12_CMD_CFG | RFM12_CFG_EL | RFM12_CFG_EF | RFM12_BASEBAND | RFM12_XTAL_12PF);
	// 1. command 0x80D7
	
	//set power default state (usually disable clock output)
	//do not write the power register two times in a short time
	//as it seems to need some recovery
	rfm12_data(RFM12_CMD_PWRMGT | PWRMGT_DEFAULT);
	// 2. command 0x8201

	//set frequency
	rfm12_data(RFM12_CMD_FREQUENCY | RFM12_FREQUENCY_CALC(FREQ) );
	// 3. command 0xA0B0

	//set data rate
	rfm12_data(RFM12_CMD_DATARATE | DATARATE_VALUE );
	// 4. command 0xC623
	
	//set rx parameters: int-in/vdi-out pin is vdi-out,
	//Bandwith, LNA, RSSI
	rfm12_data(RFM12_CMD_RXCTRL | RFM12_RXCTRL_P16_VDI
	| RFM12_RXCTRL_VDI_FAST | RFM12_RXCTRL_BW_400 | RFM12_RXCTRL_LNA_20
	| RFM12_RXCTRL_RSSI_79 );
	// 5. command 0x942C
	
	//automatic clock lock control(AL), digital Filter(!S),
	//Data quality detector value 3, slow clock recovery lock
	rfm12_data(RFM12_CMD_DATAFILTER | RFM12_DATAFILTER_AL | 3);
	// 6. command 0xC2AB
	
	//2 Byte Sync Pattern, Start fifo fill when sychron pattern received,
	//disable sensitive reset, Fifo filled interrupt at 8 bits
	rfm12_data(RFM12_CMD_FIFORESET | RFM12_FIFORESET_DR | (8<<4));
	// 7. command 0xCA81

	//set AFC to automatic, (+4 or -3)*2.5kHz Limit, fine mode, active and enabled
	rfm12_data(RFM12_CMD_AFC | RFM12_AFC_AUTO_KEEP | RFM12_AFC_LIMIT_4
	| RFM12_AFC_FI | RFM12_AFC_OE | RFM12_AFC_EN);
	// 8. command 0xC4F7
	
	//set TX Power to -0dB, frequency shift = +-125kHz
	rfm12_data(RFM12_CMD_TXCONF | RFM12_TXCONF_POWER_0 | RFM12_TXCONF_FS_CALC(125000) );
	// 9. command 0x9870
	
	//disable low dutycycle mode
	rfm12_data(RFM12_CMD_DUTYCYCLE);
	// 10. command 0xC800
	
	//disable wakeup timer
	rfm12_data(RFM12_CMD_WAKEUP);
	// 11. command 0xE000

	//store the syncronization pattern to the transmission buffer
	//the sync pattern is used by the receiver to distinguish noise from real transmissions
	//the sync pattern is hardcoded into the receiver
	
	rf_tx_buffer.sync[0] = SYNC_MSB;
	rf_tx_buffer.sync[1] = SYNC_LSB;

	
	//enable rf receiver chain, if receiving is not disabled (default)
	//the magic is done via defines
	rfm12_data(RFM12_CMD_PWRMGT | PWRMGT_RECEIVE);
	// 12. command 0x8281
	
	//ASK receive mode feature initialization
	#if RFM12_RECEIVE_ASK
	adc_init();
	#endif

	//setup interrupt for falling edge trigger
	RFM12_INT_SETUP();
	
	//clear int flag
	rfm12_read(RFM12_CMD_STATUS);
	RFM12_INT_FLAG |= (1<<RFM12_FLAG_BIT);
	// 13. command 0x0000
	
	//init receiver fifo, we now begin receiving.
	rfm12_data(CLEAR_FIFO);
	// 14. command 0xCA81
	rfm12_data(ACCEPT_DATA);
	// 15. command 0xCA83
	
	//activate the interrupt
	RFM12_INT_ON();
}

void rfm12_data(uint16_t d)
{
	SS_ASSERT();
	SPDR = d>>8;
	while(!(SPSR & (1<<SPIF)));

	SPDR = d & 0xff;
	while(!(SPSR & (1<<SPIF)));
	SS_RELEASE();
}

//! The tick function implements collision avoidance and initiates transmissions.
/** This function has to be called periodically.
* It will read the rfm12 status register to check if a carrier is being received,
* which would indicate activity on the chosen radio channel. \n
* If there has been no activity for long enough, the channel is believed to be free.
*
* When there is a packet waiting for transmission and the collision avoidance
* algorithm indicates that the air is free, then the interrupt control variables are
* setup for packet transmission and the rfm12 is switched to transmit mode.
* This function also fills the rfm12 tx fifo with a preamble.
*
* \warning Warning, if you do not call this function periodically, then no packet will get transmitted.
* \see rfm12_tx() and rfm12_start_tx()
*/
void rfm12_tick(void)
{
	//collision detection is enabled by default
	#if !(RFM12_NOCOLLISIONDETECTION)
	uint16_t status;
	
	//start with a channel free count of 16, this is necessary for the ASK receive feature to work
	static uint8_t channel_free_count = 16; //static local variables produce smaller code size than globals
	#endif

	//debug
	#if RFM12_UART_DEBUG
	static uint8_t oldstate;
	uint8_t state = ctrl.rfm12_state;
	if (oldstate != state)
	{
		uart_putstr ("mode change: ");
		switch (state)
		{
			case STATE_RX_IDLE:
			uart_putc ('i');
			break;
			case STATE_RX_ACTIVE:
			uart_putc ('r');
			break;
			case STATE_TX:
			uart_putc ('t');
			break;
			default:
			uart_putc ('?');
		}
		uart_putstr ("\r\n");
		oldstate = state;
	}
	#endif
	
	//don't disturb RFM12 if transmitting or receiving
	if(ctrl.rfm12_state != STATE_RX_IDLE)
	{
		return;
	}
	
	//collision detection is enabled by default
	#if !(RFM12_NOCOLLISIONDETECTION)
	//disable the interrupt (as we're working directly with the transceiver now)
	//hint: we could be losing an interrupt here
	//solutions: check status flag if int is set, launch int and exit ... OR implement packet retransmission
	RFM12_INT_OFF();
	status = rfm12_read(RFM12_CMD_STATUS);
	RFM12_INT_ON();

	//check if we see a carrier
	if(status & RFM12_STATUS_RSSI)
	{
		//yes: reset free counter and return
		channel_free_count = CHANNEL_FREE_TIME;
		return;
	}
	
	//no: decrement counter
	channel_free_count--;
	
	//is the channel free long enough ?
	if(channel_free_count != 0)
	{
		return;
	}
	
	//reset the channel free count for the next decrement (during the next call..)
	channel_free_count = 1;
	#endif
	
	//do we have something to transmit?
	if(ctrl.txstate == STATUS_OCCUPIED)
	{ //yes: start transmitting
		//disable the interrupt (as we're working directly with the transceiver now)
		//hint: we could be losing an interrupt here, too
		//we could also disturb an ongoing reception,
		//if it just started some cpu cycles ago
		//(as the check for this case is some lines (cpu cycles) above)
		//anyhow, we MUST transmit at some point...
		RFM12_INT_OFF();
		
		//disable receiver - if you don't do this, tx packets will get lost
		//as the fifo seems to be in use by the receiver
		rfm12_data(RFM12_CMD_PWRMGT | PWRMGT_DEFAULT);
		
		//calculate number of bytes to be sent by ISR
		//2 sync bytes + len byte + type byte + checksum + message length + 1 dummy byte
		ctrl.num_bytes = rf_tx_buffer.len + 6;
		
		//reset byte sent counter
		ctrl.bytecount = 0;
		
		//set mode for interrupt handler
		ctrl.rfm12_state = STATE_TX;
		
		//wakeup timer feature
		#if RFM12_USE_WAKEUP_TIMER
		ctrl.pwrmgt_shadow = (RFM12_CMD_PWRMGT | PWRMGT_DEFAULT | RFM12_PWRMGT_ET);
		#endif /* RFM12_USE_WAKEUP_TIMER */
		
		//fill 2byte 0xAA preamble into data register
		//the preamble helps the receivers AFC circuit to lock onto the exact frequency
		//(hint: the tx FIFO [if el is enabled] is two staged, so we can safely write 2 bytes before starting)
		rfm12_data(RFM12_CMD_TX | PREAMBLE);
		rfm12_data(RFM12_CMD_TX | PREAMBLE);
		
		//set ET in power register to enable transmission (hint: TX starts now)
		rfm12_data(RFM12_CMD_PWRMGT | PWRMGT_DEFAULT | RFM12_PWRMGT_ET);

		//enable the interrupt to continue the transmission
		RFM12_INT_ON();
	}
}	
	
	//uint8_t	rfm12_start_tx(uint8_t type, uint8_t length)
	uint8_t	rfm12_start_tx(uint8_t length)
	{
		//exit if the buffer isn't free
		if(ctrl.txstate != STATUS_FREE)
		return TXRETURN(RFM12_TX_OCCUPIED);
		
		//write airlab header to buffer
		rf_tx_buffer.len = length;
		//rf_tx_buffer.type = type;
		//rf_tx_buffer.checksum = length ^ 0xff;
		
		//schedule packet for transmission
		ctrl.txstate = STATUS_OCCUPIED;
		
		return TXRETURN(RFM12_TX_ENQUEUED);
	}
	
	//uint8_t	rfm12_tx(uint8_t len, uint8_t type, uint8_t *data)
	uint8_t	rfm12_tx(uint8_t len, uint8_t *data)
	{
		#if RFM12_UART_DEBUG
		uart_putstr ("sending packet\r\n");
		#endif
		
		if (len > RFM12_TX_BUFFER_SIZE) return TXRETURN(RFM12_TX_ERROR);

		//exit if the buffer isn't free
		if(ctrl.txstate != STATUS_FREE)
		return TXRETURN(RFM12_TX_OCCUPIED);
		
		memcpy ( rf_tx_buffer.buffer, data, len );

		return rfm12_start_tx (len);
	}
	
	uint8_t rfm12_read_fifo()
	{
		SS_ASSERT();

		SPDR =  ( RFM12_CMD_READ >> 8 );
		while(!(SPSR & (1<<SPIF)));

		SPDR = 0;
		while(!(SPSR & (1<<SPIF)));

		SS_RELEASE();
		return SPDR;
	}
	
	/* @description reads the upper 8 bits of the status
 * register (the interrupt flags)
 */
 uint8_t rfm12_read_int_flags()
{
	SS_ASSERT();
	#if !(RFM12_SPI_SOFTWARE)
	SPDR = 0;
	while(!(SPSR & (1<<SPIF)));
	SS_RELEASE();
	return SPDR;

	#else
	unsigned char x, d=d;
	PORT_MOSI &= ~(1<<BIT_MOSI);	
	for(x=0;x<8;x++){
		PORT_SCK |= (1<<BIT_SCK);
		d<<=1;
		if(PIN_MISO & (1<<BIT_MISO)){
			d|=1;
		}
		PORT_SCK &= ~(1<<BIT_SCK);
	}
	SS_RELEASE();
	return d;
	#endif
}

//! Function to clear buffer complete/occupied status.
	/** This function will set the current receive buffer status to free and switch
	* to the other buffer, which can then be read using rfm12_rx_buffer().
	*
	* \see rfm12_rx_status(), rfm12_rx_len(), rfm12_rx_type(), rfm12_rx_buffer() and rf_rx_buffers
	*/
	//warning: without the attribute, gcc will inline this even if -Os is set
	void  rfm12_rx_clear(void)
	{
		//debug
		#if RFM12_UART_DEBUG >= 2
		uart_putc('l');
		#endif
		
			//mark the current buffer as empty
			ctrl.rf_buffer_out->status = STATUS_FREE;
			
			//switch to the other buffer
			ctrl.buffer_out_num = (ctrl.buffer_out_num + 1 ) % 2 ;
			ctrl.rf_buffer_out = &rf_rx_buffers[ctrl.buffer_out_num];
		
	}



//! Interrupt handler to handle all transmit and receive data transfers to the rfm12.
/** The receiver will generate an interrupt request (IT) for the
* microcontroller - by pulling the nIRQ pin low - on the following events:
* - The TX register is ready to receive the next byte (RGIT)
* - The FIFO has received the preprogrammed amount of bits (FFIT)
* - Power-on reset (POR)
* - FIFO overflow (FFOV) / TX register underrun (RGUR)
* - Wake-up timer timeout (WKUP)
* - Negative pulse on the interrupt input pin nINT (EXT)
* - Supply voltage below the preprogrammed value is detected (LBD)
*
* The rfm12 status register is read to determine which event has occured.
* Reading the status register will clear the event flags.
*
* The interrupt handles the RGIT and FFIT events by default.
* Upon specific configuration of the library the WKUP and LBD events
* are handled additionally.
*
* \see rfm12_control_t, rf_rx_buffer_t and rf_tx_buffer_t
*/
//if polling is used, do not define an interrupt handler, but a polling function

ISR(RFM12_INT_VECT, ISR_NOBLOCK)
{
	RFM12_INT_OFF();
	uint8_t status;
	
	//if receive mode is not disabled (default)
	#if !(RFM12_TRANSMIT_ONLY)
	static uint8_t checksum; //static local variables produce smaller code size than globals
	#endif /* !(RFM12_TRANSMIT_ONLY) */

	//first we read the first byte of the status register
	//to get the interrupt flags
	status = rfm12_read_int_flags();

	//low battery detector feature
	#if RFM12_LOW_BATT_DETECTOR
	if(status & (RFM12_STATUS_LBD>>8))
	{
		//debug
		#if RFM12_UART_DEBUG >= 2
		uart_putc('L');
		#endif
		
		//set status variable to low battery
		ctrl.low_batt = RFM12_BATT_LOW;
	}
	#endif /* RFM12_LOW_BATT_DETECTOR */
	
	//wakeup timer feature
	#if RFM12_USE_WAKEUP_TIMER
	if(status & (RFM12_STATUS_WKUP>>8))
	{
		//debug
		#if RFM12_UART_DEBUG >= 2
		uart_putc('W');
		#endif
		
		//restart the wakeup timer by toggling the bit on and off
		rfm12_data(ctrl.pwrmgt_shadow & ~RFM12_PWRMGT_EW);
		rfm12_data(ctrl.pwrmgt_shadow);
	}
	#endif /* RFM12_USE_WAKEUP_TIMER */
	
	//check if the fifo interrupt occurred
	if(!(status & (RFM12_STATUS_FFIT>>8)))
	goto END;
	
	//see what we have to do (start rx, rx or tx)
	switch(ctrl.rfm12_state)
	{
		case STATE_RX_IDLE:
		//if receive mode is not disabled (default)
		#if !(RFM12_TRANSMIT_ONLY)
		//init the bytecounter - remember, we will read the length byte, so this must be 1
		ctrl.bytecount = 1;

		//read the length byte,  and write it to the checksum
		//remember, the first byte is the length byte
		checksum = rfm12_read_fifo();
		
		//add the packet overhead and store it into a working variable
		ctrl.num_bytes = checksum + PACKET_OVERHEAD;
		
		//debug
		#if RFM12_UART_DEBUG >= 2
		uart_putc('I');
		//uart_putc(checksum);
		//uart_putc(itoa(ctrl.rfm12_state));
		//ctrl.rf_buffer_in->status = STATUS_FREE;
		#endif
		
		//see whether our buffer is free
		//FIXME: put this into global statekeeping struct, the free state can be set by the function which pulls the packet, i guess
		//if(ctrl.rf_buffer_in->status == STATUS_FREE)
		if(rx_status == STATUS_FREE)
		{
			//debug
			#if RFM12_UART_DEBUG >= 2
			uart_putc('f');
			#endif
			
			//the current receive buffer is empty, so we start receiving
			ctrl.rfm12_state = STATE_RX_ACTIVE;
			
			//store the received length into the packet buffer
			//FIXME:  why the hell do we need this?!
			//in principle, the length is stored alongside with the buffer.. the only problem is, that the buffer might be cleared during reception
			ctrl.rf_buffer_in->len = checksum;
			
			//end the interrupt without resetting the fifo
			goto END;
		}
		
		/* if we're here, the buffer is full, so we ignore this transmission by resetting the fifo (at the end of the function)  */
		#endif /* !(RFM12_TRANSMIT_ONLY) */
		break;
		
		case STATE_RX_ACTIVE:
		
		//debug
		#if RFM12_UART_DEBUG >= 2
		uart_putc('a');
		#endif
		
		//if receive mode is not disabled (default)
		#if !(RFM12_TRANSMIT_ONLY)
		//check if transmission is complete
		if(ctrl.bytecount < ctrl.num_bytes)
		{
			uint8_t data;
			
			//read a byte
			data = rfm12_read_fifo();
			
			//debug
			#if RFM12_UART_DEBUG >= 2
			uart_putc('R');
			uart_putc(data);
			#endif
			
			//xor the remaining bytes onto the checksum
			//note: only the header will be effectively checked
			checksum ^= data;
			
			//put next byte into buffer, if there is enough space
			if(ctrl.bytecount < (RFM12_RX_BUFFER_SIZE + 3))
			{
				//hackhack: begin writing to struct at offsetof len
				(& ctrl.rf_buffer_in->len)[ctrl.bytecount] = data;
			}
			
			//check header against checksum
			if (ctrl.bytecount == 2 && checksum != 0xff)
			{
				//if the checksum does not match, reset the fifo
				break;
			}

			//increment bytecount
			ctrl.bytecount++;
			
			//end the interrupt without resetting the fifo
			goto END;
		}
		
		/* if we're here, receiving is done */
		/* the fifo will be reset at the end of the function */

		//debug
		#if RFM12_UART_DEBUG >= 2
		uart_putc('D');
		#endif
		
		//indicate that the buffer is ready to be used
		ctrl.rf_buffer_in->status = STATUS_COMPLETE;
		
		//switch to other buffer
		ctrl.buffer_in_num = (ctrl.buffer_in_num + 1) % 2;
		ctrl.rf_buffer_in = &rf_rx_buffers[ctrl.buffer_in_num];
		#endif /* !(RFM12_TRANSMIT_ONLY) */
		break;
		
		case STATE_TX:
		//debug
		#if RFM12_UART_DEBUG >= 2
		uart_putc('T');
		#endif

		if(ctrl.bytecount < ctrl.num_bytes)
		{
			//load the next byte from our buffer struct.
			rfm12_data( RFM12_CMD_TX + rf_tx_buffer.sync[ctrl.bytecount++]);
			
			//end the interrupt without resetting the fifo
			goto END;
		}
		
		/* if we're here, we're finished transmitting the bytes */
		/* the fifo will be reset at the end of the function */
		
		
		//flag the buffer as free again
		ctrl.txstate = STATUS_FREE;
		
		//wakeup timer feature
		#if RFM12_USE_WAKEUP_TIMER
		//clear wakeup timer once
		rfm12_data(ctrl.pwrmgt_shadow & ~RFM12_PWRMGT_EW);
		//set shadow register to default receive state
		//the define correctly handles the transmit only mode
		ctrl.pwrmgt_shadow = (RFM12_CMD_PWRMGT | PWRMGT_RECEIVE);
		#endif /* RFM12_USE_WAKEUP_TIMER */
		
		//turn off the transmitter and enable receiver
		//the receiver is not enabled in transmit only mode
		//if the wakeup timer is used, this will re-enable the wakeup timer bit
		//the magic is done via defines
		rfm12_data(RFM12_CMD_PWRMGT | PWRMGT_RECEIVE);
		
		//load a dummy byte to clear int status
		rfm12_data( RFM12_CMD_TX + 0xaa);
		break;
	}
	
	//set the state machine to idle
	ctrl.rfm12_state = STATE_RX_IDLE;
	
	//reset the receiver fifo, if receive mode is not disabled (default)
	#if !(RFM12_TRANSMIT_ONLY)
	rfm12_data(RFM12_CMD_FIFORESET + CLEAR_FIFO_INLINE);
	rfm12_data(RFM12_CMD_FIFORESET + ACCEPT_DATA_INLINE);
	#endif /* !(RFM12_TRANSMIT_ONLY) */
	
	END:
	//turn the int back on
	RFM12_INT_ON();
}