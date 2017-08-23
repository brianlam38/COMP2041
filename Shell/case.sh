#!/bin/sh

while read f
do
	case $f in
		hello)			echo English 	;;
		howdy)			echo American 	;;
		gday)			echo Australia	;;
		bonjour)		echo French		;;
		"guten tag")	echo German		;;
		*)				echo Unknown Language: $f ;;
	esac
done < myfile	# stdin, read from file "myfile"