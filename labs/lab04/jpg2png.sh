#!/bin/sh

for pic in *.jpg
do
	echo $pic | cut -f1 -d '.'
	convert "$pic".jpg "$pic".png
	#sed 's/*\.jpg/$pic\.png/'
done