#!/bin/sh

# Count the number of tmess each different word occurs in the files given as args
# USAGE: ./word_freq.sh file.txt

sed 's/ /\n/g' "$@" |		# "For all occurences of a space, replace with a newline"
								# converts to one word per line (sed = stream editor)
tr A-Z a-z |				# "Substitute upper letters to lower letters + print to output"
								# map uppercase to lower case (tr = transliterate)
sed "s/[^a-z']//g" |		# Remove all chars except a-z and '
egrep -v '^$' |				# Remove empty lines
sort |						# Sort words in alphabetical order
uniq -c |					# Precede each output line with the number of times the line has occurred
sort -n 					# Sort words in numerical order
								# words will be ordered by the occurrence number preceding each line