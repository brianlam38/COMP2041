#!/bin/sh

for pic in *.jpg
do
	if [ -e "$pic".png ]
	then
		echo $pic already exists
	else
		convert "$pic" "${pic%.*}".png
		rm "$pic"
	fi
done

