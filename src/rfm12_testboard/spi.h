/*
 * spi.h
 *
 * Created: 20.08.2013 19:12:34
 *  Author: jbolay
 */ 


#ifndef SPI_H_
#define SPI_H_

#include "rfm12_config.h"

//hardware spi helper macros
#define SS_ASSERT() PORT_SS &= ~(1<<BIT_SS)
#define SS_RELEASE() PORT_SS |= (1<<BIT_SS)

void spi_init();



#endif /* SPI_H_ */