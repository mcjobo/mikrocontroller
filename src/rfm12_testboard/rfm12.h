/*
 * IncFile1.h
 *
 * Created: 22.08.2013 20:54:58
 *  Author: jbolay
 */ 


#ifndef INCFILE1_H_
#define INCFILE1_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include "spi.h"
#include "rfm12_hw.h"
#include "rfm12_core.h"
#include "uart.h"


uint16_t  rfm12_read(uint16_t c);

void rfm12_init(void);

void rfm12_data(uint16_t d);

void rfm12_tick(void);

//uint8_t	rfm12_start_tx(uint8_t type, uint8_t length);
uint8_t	rfm12_start_tx(uint8_t length);

uint8_t	rfm12_tx(uint8_t len, uint8_t *data);

uint8_t rfm12_read_fifo();

uint8_t rfm12_read_int_flags();

void  rfm12_rx_clear(void);

	
/** \name States for rx and tx buffers
* \anchor rxtx_states
* \see rfm12_rx_status() and rfm12_control_t
* @{
	*/
	//! Indicates that the buffer is free
	#define STATUS_FREE 0
	//! Indicates that the buffer is in use by the library
	#define STATUS_OCCUPIED 1
	//! Indicates that a receive buffer holds a complete transmission
	#define STATUS_COMPLETE 2
//@}

	//! The receive buffer structure.
	/** \note Note that there will be two receive buffers of this type,
	* as double buffering is being employed by this library.
	*
	* \see rfm12_rx_status(), rfm12_rx_len(), rfm12_rx_type(), rfm12_rx_buffer() , rfm12_rx_clear() and rf_rx_buffers
	*/
	typedef struct
	{
		//! Indicates if the buffer is free or completed.
		/** \see \ref rxtx_states "States for rx and tx buffers" */
		volatile uint8_t status;
		
		//! Length byte - number of bytes in buffer.
		uint8_t len;
		
		//! The actual receive buffer data
		uint8_t buffer[RFM12_RX_BUFFER_SIZE]; 
	} rf_rx_buffer_t;
	
	
//! Control and status structure.
/** This data structure keeps all control and some status related variables. \n
* By using a central structure for all global variables, the compiler can
* use smaller instructions and reduce the size of the binary.
*
* \note Some states are defined in the non-documented rfm12_core.h header file.
* \see ISR(RFM12_INT_VECT, ISR_NOBLOCK), rfm12_tick() and ctrl
*/
typedef struct
{
	//! This controls the library internal state machine.
	volatile uint8_t rfm12_state;
	
	//! Transmit buffer status.
	/** \see \ref rxtx_states "States for rx and tx buffers" */
	volatile uint8_t txstate;
	
	//! Number of bytes to transmit or receive.
	/** This refers to the overall data size, including header data and sync bytes. */
	uint8_t num_bytes;
	
	//! Counter for the bytes we are transmitting or receiving at the moment.
	uint8_t bytecount;

	//! Points to the receive buffer that will be filled next.
	rf_rx_buffer_t * rf_buffer_in;
		
	//! Points to the receive buffer that will be returned for the next read.
	rf_rx_buffer_t * rf_buffer_out;
		
	//! the number of the currently used in receive buffer.
	uint8_t buffer_in_num;
		
	//! the number of the currently used out receive buffer.
	uint8_t buffer_out_num;
	
	//wakeup timer feature
	#if RFM12_USE_WAKEUP_TIMER
		//! Power management shadow register.
		/** The wakeup timer feature needs to buffer the current power management state. */
		uint16_t pwrmgt_shadow;
	#endif /* RFM12_USE_WAKEUP_TIMER */
	
	#if RFM12_LOW_BATT_DETECTOR
		//! Low battery detector status.
		/** \see \ref batt_states "States for the low battery detection feature",
		* as well as rfm12_set_batt_detector() and rfm12_get_batt_status()
		*/
		uint8_t low_batt;
	#endif /* RFM12_LOW_BATT_DETECTOR */
} rfm12_control_t;

//! The transmission buffer structure.
/** \note Note that this complete buffer is transmitted sequentially,
* beginning with the sync bytes.
*
* \see rfm12_start_tx(), rfm12_tx() and rf_tx_buffer
*/
typedef struct
{
	//! Sync bytes for receiver to start filling fifo.
	uint8_t sync[2];
	
	//! Length byte - number of bytes in buffer.
	uint8_t len;

	//! Buffer for the raw bytes to be transmitted.
	uint8_t buffer[RFM12_TX_BUFFER_SIZE];
} rf_tx_buffer_t;


/** \name  Return values for rfm12_tx() and rfm12_start_tx()
* \anchor tx_retvals
* \see rfm12_tx() and rfm12_start_tx()
* @{
	*/
	//!  The packet data is longer than the internal buffer
	#define RFM12_TX_ERROR 0x02
	//! The transmit buffer is already occupied
	#define RFM12_TX_OCCUPIED 0x03
	//! The packet has been enqueued successfully
	#define RFM12_TX_ENQUEUED 0x80
//@}

//the control struct
extern rfm12_control_t ctrl;
//extern volatile rx_status;


//! Inline function to return the rx buffer status byte.
	/** \returns STATUS_FREE or STATUS_COMPLETE
	* \see \ref rxtx_states "rx buffer states", rfm12_rx_len(), rfm12_rx_type(), rfm12_rx_buffer(), rfm12_rx_clear() and rf_rx_buffer_t
	*/
	static inline uint8_t rfm12_rx_status(void)	{
		return ctrl.rf_buffer_out->status;
	}

	static inline uint8_t rfm12_tx_status(void)
	{
		return ctrl.txstate;
	}

	//! Inline function to return the rx buffer length field.
	/** \returns The length of the data inside the buffer
	* \see rfm12_rx_status(), rfm12_rx_type(), rfm12_rx_buffer(), rfm12_rx_clear() and rf_rx_buffer_t
	*/
	static inline uint8_t rfm12_rx_len(void)
	{
		return ctrl.rf_buffer_out->len;
	}

	//! Inline function to return the rx buffer type field.
	/** \returns The packet type from the packet header type field
	* \see rfm12_rx_status(), rfm12_rx_len(), rfm12_rx_buffer(), rfm12_rx_clear() and rf_rx_buffer_t
	*/
	/*static inline uint8_t rfm12_rx_type(void)
	{
		return ctrl.rf_buffer_out->type;
	}*/

	//! Inline function to retreive current rf buffer contents.
	/** \returns A pointer to the current receive buffer contents
	* \see rfm12_rx_status(), rfm12_rx_len(), rfm12_rx_type(), rfm12_rx_clear() and rf_rx_buffer_t
	*/
	static inline uint8_t *rfm12_rx_buffer(void)
	{
		return (uint8_t*) ctrl.rf_buffer_out->buffer;
	}
	
	
#endif /* INCFILE1_H_ */