#!/bin/sh

# Print integers 1..n if 1 argument is given.
# Print integers n..m if 2 arguments are given.

# VERSION 1: USING TEST COMMAND
# VERSION 2: USING ARITHMETIC EXPANSION
# Simply replace all test [ expressions ] below with arithmetic expressions $(())

if [ $# = 1 ]							# if num args = 1, start = 1, finish = arg1
then
	start=1
	finish=$1
elif [ $# = 2 ]							# if num args = 2, start = arg1, finish = arg2
then
	start=$1
	finish=$2
else									# usage error
	echo "Usage: $0 <start> <finish>"
	exit 1
fi

# for each arg in set of args, if arg is NOT an integer, return error msg
for argument in "$@"
do
	if echo "$argument" | egrep -v '^-?[0-9]+$' >/dev/null
	then
		echo "$0: argument '$argument' is not an integer"
		exit 1
	fi
done

# set number = first arg. While number is not at integer 2, iterate number.
number=$start
while [ $number -le $finish ]
do
	echo $number
	number=`expr $number + 1`	# or number=$(($number + 1))
done


