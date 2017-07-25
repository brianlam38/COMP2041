#!/bin/bash

for pic in *.jpg

do
	echo $pic | cut -f1 -d'.'
	if [-e "$pic".png]
		then
			#file exists, do nothing
			echo "$pic".png already exists
		else
			#file doesn't exist, convert png + remove jpg
			convert "$pic".jpg "$pic".png
			rm "$pic".jpg
	fi
done
