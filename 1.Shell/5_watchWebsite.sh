#!/bin/sh

# Repeatedly download a specified webpage and check if it has
# been updated with a specific regular expression.
# If the regular expression appears, send and email to X to notify them.

repeat_seconds=300			# check every 5 minutes

if [ $# = 3 ]				# if num args = 3
then
	url=$1					# url = arg 1
	regexp=$2				# regexp = arg 2
	email_address=$3		# email = arg 3
else
	echo "Usage: $0 <url> <regex>" 1>&2		# args != 3, exit program
	exit 1
fi

while true
do  
	# downloads webpage, dumps output to /dev/null
	if wget -O- -q "$url"|egrep "$regexp" >/dev/null	
	then
		echo "Generated by $0" | mail -s "$url now matches $regexp" $email_address
		exit 0
	fi
	sleep $repeat_seconds
done