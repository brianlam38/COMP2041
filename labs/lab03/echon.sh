#!/bin/sh

# bad usage error
if test $# -ne 2
then
	echo "Usage: $0 <number of lines> <string>"
	exit 1
fi

# correct usage output
counter=0
while test $counter -lt $1
do
	echo $2
	counter=$((counter+1))
done
