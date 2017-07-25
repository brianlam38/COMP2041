#!/bin/bash
for x;
do
	date=`ls -l "$x" | cut -f6-8 -d' '`
	convert -gravity south -pointsize 36 -draw 0 "$date" "$x" "$x"
done