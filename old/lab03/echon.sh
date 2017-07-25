#!/bin/sh

#2 arguments
if test $# -ne 2
then
	echo "Usage: $0 <number of lines> <string>"
	exit 1
fi

#non-neg input
if test $1 -lt 0
then
	echo "$0: argument 1 must be a non-negative integer"
	exit 1
fi

#counter for number of echoes
counter=0
while test $counter -lt $1
do
	echo $2
	counter=$((counter+1))
done
