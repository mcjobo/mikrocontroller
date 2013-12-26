/***************************************************************************
 *            thread.h
 *
 *  Wed Dec 16 19:43:03 2009
 *  Copyright  2009  Dirk Broßwick
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

/**
 * \ingroup system
 * \addtogroup THREAD Ein einfacher Schedular um Programm zyklisch aufzurufen.
 *
 * @{
 */

/**
 * \file
 * Verwalten eine Threadliste mit Funktionen die zyklisch durchlaufen werden. Diese Programme/Funktionen
 * sollten nicht blockierend geschrieben sein um eine Funktion zu garantieren.
 *
 * \author Dirk Broßwick
 */

#ifndef THREAD_H
	#define THREAD_H

	#include <avr/pgmspace.h>  

	#define THREAD_MAX	11

	typedef void ( * THREAD_CALLBACK ) ( void );

	void THREAD_init( void );
	int THREAD_RegisterThread( THREAD_CALLBACK thread_function, const char * thread_name );
	void THREAD_mainloop( void );

	struct THREAD {
		volatile	THREAD_CALLBACK			thread_function;
		const 		char 				* thread_name;
	};

#endif

/**
 * @}
 */
