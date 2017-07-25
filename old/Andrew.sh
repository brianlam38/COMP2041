#!/bin/sh

### EXAMPLE SHELL SCRIPTS ###

#variable assignment
name=Andrew
echo $name you are really cool
echo $name you are very attractive
echo you are not a loser

#shell if statements
if date >/dev/null
then
	echo Andrew Rocks
else
	echo Andrew is a loser
fi

#shell loops + /dev/null
while date >/dev/null
do
	echo Andrew Rocks
	sleep 2
done

#numbers adding on itself
i=1
while true
	do
		echo $i
		i=`expr $i + 1`
	done

#numbers adding, with stop condition
i=1
while test -lt 1000
	do
		echo $i
		i=`expr $i + 1`
	done

#For Loop
for f in *
do
	echo $f
done

#Autoupdater from a website
curl http://127.0.0.1/ >output
while true
do
	cp output oldoutput
	curl http://127.0.0.1/ >output
	if diff output oldoutput
	then
		echo -n .
	else
		echo website changed
	fi
	sleep 1
done

#Autoupdater: Track specific text
while true
do
	curl http://127.0.0.1/ >output 2>/dev/null
	if egrep -i `(taylor|Tailor).*siwft` output
	then
		echo TAYLOR SWIFT TICKETS ON SALE!
	else
		echo -n .
	fi
	sleep 1
done

#uppercase to lowercase
for uc_filename in *
do
	lc_filename=`echo $uc_filename|tr A-Z a-z`
	if test "$lc_filename" = "$uc_filename"
	then
		continue
	fi
	if test -e "$lc_filename"
	then
		echo "$lc_filename already exists"
		continue
	fi
	mv "$uc_filename" "$lc_filename"
done










