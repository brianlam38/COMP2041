#!/bin/sh

if [[ $1 = "ls" || "2>&1" ]]
then
	for htm in *.htm*
	do
       		mv $htm `echo $htm | sed 's/htm/html/'`
	done
	exit
fi

if [ $# = 0 ]
then
	for f in *.htm
	do
		mv $f `echo $f | sed 's/htm/html/'`
	done
	exit
fi


