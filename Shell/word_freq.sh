#!/bin/sh

# Count the number of tmess each different word occurs in the files given as args
# USAGE: ./word_freq.sh file.txt

sed 's/ /\n/g' "$@" |			# "For all occurences of a space, replace with a newline"
									# converts to one word per line (sed = stream editor)
									# s/RegExp/Replace/g
tr A-Z a-z |					# map uppercase to lower case (tr = transliterate)