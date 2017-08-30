#!/bin/sh

# Shell script to find the most common first name among "COMP2041" students.

egrep 'COMP2041' "$@" |		# select COMP2041 only
cut -d' ' -f2 |				# select first name column
sort |						# sort alphabetically
uniq -c |					# count name occurrences
sort -n |					# sort count
tail -n 1 |					# print only last

# fix up output
sed s/'[0-9]'//g |			# remove all integers
sed s/' '//g				# remove all white spaces
