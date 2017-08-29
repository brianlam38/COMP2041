#!/bin/sh

# Report if any files are copies of each other
# Use of diff -i = ignore case | use of diff -w = ignore white space

for file1 in "$@"
do
	for file2 in "$@"
	do
		test "$file1" = "$file2" && break			# skip comparison of same file

		if diff -i -w "$file1" "$file2" >/dev/null 	# returns true if same file, false if not
		then
			echo "$file1 is a copy of $file2"
		else
			echo "$file1 is NOT a copy of $file2"
		fi
	done
done