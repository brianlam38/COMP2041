#!/bin/sh

# Improved version of plagiarism program
#
# The substitution s/\/\/.*// removes // style C comments.
# This means changes in comments won't affect comparisons.
# We use temp files in this program.

TMP_FILE1=/tmp/plagiarism_tmp1$$
TMP_FILE2=/tmp/plagiarism_tmp2$$

for file1 in "$@"
do
	for file2 in "$@"
	do
		# avoid comparison of same file
		if [ "$file1" = "$file2" ]			
		then
			break
		fi
		# sub all comments with nothing (remove comments)
		sed 's/\/\/.*//' "$file1" >$TMP_FILE1	
		sed 's/\/\/.*//' "$file2" >$TMP_FILE2
		# if same, return COPY. if not same, return NOT COPY
		if diff -i -w $TMP_FILE1 $TMP_FILE2 >/dev/null # 
		then
			echo "$file1 is a copy of $file2"
		else
			echo "$file1 is NOT a copy of $file2"
		fi
	done
done

# remove both tmp files
rm -f $TMP_FILE1 $TMP_FILE2




