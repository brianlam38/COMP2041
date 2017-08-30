#!/bin/sh

egrep 'COMP2041' "$@" |
cut -d' ' -f2 |
sort |
uniq -c |
sort -n |
tail -n 1 |
sed s/'[0-9]'//g |	# remove all instances of integers
sed s/' '//g
