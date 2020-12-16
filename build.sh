#!/bin/bash

CC=gcc

PROGRAMS="A B"

A_SRCS="point.c point_main.c"
A_HDRS="point.h"
A_EXEC=point

B_SRCS="person.c person_main.c"
B_HDRS="person.h"
B_EXEC=person


if [ $1 ] && [ $1 == "clean" ]
then
    echo "Deleting obj and exec..."
    rm -f *.o ${EXEC}
    for x in $PROGRAMS
    do
        EXEC="${x}_EXEC"
        rm -f ${!EXEC}
    done
    echo "DONE"
    exit
fi



function build_obj() #//A_SRCS="point.c point_main.c"
{
    ISRCS=${!@}
    unset OBJS
    for SRC in $ISRCS
    do
        OBJ=${SRC/%.c/.o}

        OBJS="$OBJ $OBJS"

        for HDR in ${!HDRS} #//A_HDRS="point.h"
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
    tput setaf 1; echo "----->" $@
    tput sgr0;
    IOBJS=$@

    for OBJ in $IOBJS
    do
        #echo $OBJ
        if [ ${OBJ} -nt "./${!EXEC}" ]
        then
            echo "Building ${!EXEC}..."
            $CC -o ${!EXEC} $IOBJS
            break
        fi

    done
}

for x in $PROGRAMS
do

    SRCS="${x}_SRCS"
    HDRS="${x}_HDRS"
    EXEC="${x}_EXEC"

    build_obj $SRCS
    build_exec $OBJS

done