#!/bin/sh

# Change the names of the specified files to lower case.

if [ $# = 0 ]											
then
	echo "Usage $0: <files>" 1>&2
	exit 1
fi

for filename in "$@"
do
	new_filename=`echo "$filename" | tr A-Z a-z`
	test "$filename" = "$new_filename" && continue
	if [ -r "$new_filename" ]
	then
		echo "$0: $new_filename exists" 1>&2
	elif [ -e "$filename" ]
	then
		mv -- "$filename" "$new_filename"
	else
		echo "$0: $filename not found" 1>&2
	fi
done