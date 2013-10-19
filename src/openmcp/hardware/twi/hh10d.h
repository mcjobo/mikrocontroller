/***************************************************************************
 *            hh10d.h
 *
 *  Sun Aug  7 18:27:25 2011
 *  Copyright  2011  Dirk Broßwick
 *  <sharandac@snafu.de>
 ****************************************************************************/

/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor Boston, MA 02110-1301,  USA
 */
 
#ifndef HH10D_H_

	#define HH10D_H_

	#define		MEAS_INTERVAL		10
	#define		MEAS_PRESCALE		10

	#define		HH10D_TWI_ADDR		0x51

	void HH10D_init( void );
	int	HH10D_meas();

#endif // HH10D_H_ 