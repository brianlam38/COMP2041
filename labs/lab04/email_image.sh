#!/bin/bash
for x
do
	display "$x"
	echo "Address to e-mail this image to?"
	read email
	echo "Message to accompany image?"
	read message
	echo "$message"| mutt -s "$x" -a "$x" -- "$email"
done
