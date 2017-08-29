#!/bin/sh

# Change the names of the specified files to lower case.

# Incorrect program usage error
if test $# = 0 										# number of args = 0
then												# output usage error msg + exit program
	echo "Usage $0: <files>" 1>&2					# NOTE: 1 = file descriptor 1 (stdout)
	exit 1											#		2 = file descriptor 2 (stderr)
fi 													#		& = identify that it is a f.d not filenames

# Loop through all files and apply changes
for filename in "$@"
do
	new_filename=`echo "$filename" | tr A-Z a-z`		# change to lowercase + echo new name
	test "$filename" = "$new_filename" && continue		# test for errors
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