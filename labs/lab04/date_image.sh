#!/bin/bash
for x
do
	# grab image date
	date=`ls -l "$x" | cut -f6-8 -d' '`
	# annotate image
	convert -gravity south -pointsize 36 -draw "text 0,10 'HELLO WORLD $date'" "$x" "$x"
done

