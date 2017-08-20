#!/bin/bash
for x
do
	display "$x"
	#asks + takes in user email input
	echo "Address to e-mail this image to?"
	read email
	#asks + takes in user message input
	echo "Message to accompany image?"
	read message
	#reads out message and sends email
	echo "$message"| mutt -s "$x" -a "$x" -- "$email"
	echo "$x" sent to "$email"
done