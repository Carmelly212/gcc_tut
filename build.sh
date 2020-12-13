#!/bin/bash

CC=gcc

SRCS="point.c main.c"
HDRS="point.h"
EXEC=point


if [ $1 ] && [ $1 == "clean" ]
then
	echo "Deleting obj and exec..."
		rm -f *.o $EXEC
		echo "DONE"
		exit
fi



function build_obj()
{
	ISRCS=$*
	
	for SRC in $ISRCS
	do
		OBJ=${SRC/%.c/.o}
	
		OBJS="$OBJ $OBJS"
		
		for HDR in $HDRS
		do
		
			if [ $HDR -nt $OBJ ] || [ $SRC -nt $OBJ ]
			then
				echo "Compilling $SRC..."
				$CC -c -o $OBJ $SRC
			fi
		
		done

	done

}

function build_exec()
{
	IOBJS=$*
	for OBJ in $IOBJS
	do
		if [ $OBJ -nt $EXEC ]
		then
			echo "Building $EXEC..."
			$CC -o $EXEC $IOBJS
			break
		fi
	done
}

build_obj $SRCS
build_exec $OBJS


