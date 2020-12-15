#!/bin/bash

CC=gcc

PROGRAMS="A B"


A_SRCS="point.c point_main.c"
A_HDRS="point.h"
A_EXEC=point

B_SRCS="person.c person_main.c"
B_HDRS="person.h"
B_EXEC=person

for x in $PROGRAMS
	do

	SRCS="${x}_SRCS"
    HDRS="${x}_HDRS"
    EXEC="${x}_EXEC"
	

	if [ $1 ] && [ $1 == "clean" ]
	then
		echo "Deleting obj and exec..."
			rm -f *.o ${!EXEC}
			echo "DONE"
			exit
	fi



	function build_obj()
	{
		ISRCS=$@

		

		for SRC in $ISRCS
		do
			OBJ=${SRC/%.c/.o}
		
			OBJS="$OBJ $OBJS"
			
			for HDR in ${!HDRS}
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
		IOBJS=$@
		#echo $IOBJS
		for OBJ in $IOBJS
		do
			if [ $OBJ -nt ${!EXEC} ]
			then
				echo "Building ${!EXEC}..."
				$CC -o ${!EXEC} $IOBJS
				break
			fi
		done
	}

   
	build_obj ${!SRCS}
	build_exec $OBJS
	 
done


