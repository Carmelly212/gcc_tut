#!/bin/bash

A_SRCS=point.c
A_HDRS=point.h 
A_EXEC=point

B_SRCS=line.c
B_HDRS=line_main.h
B_EXEC=3

function boom()
{
    echo $@
}
# $A_SRCS=$SRCS

pro="A B"

for x in $pro
    do
    
    SRCS="${x}_SRCS"
    HDRS="${x}_HDRS"
    EXEC="${x}_EXEC"
    
    
    boom ${!SRCS}
    boom ${!HDRS}
    boom ${!EXEC}
    done




