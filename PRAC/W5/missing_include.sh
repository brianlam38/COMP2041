#!/bin/sh

for file in $@
do
	for f in `egrep '#include "' $file | sed 's/#include "//' | sed 's/"//'`
	do
		#echo "$f"
		if [ ! -e $f ]
		then
			echo $f included into $file does not exist
		fi
	done
done
