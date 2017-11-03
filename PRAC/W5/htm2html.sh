#!/bin/sh

for file in *.htm
do
	html="$file"'l'
	if [[ -e "$html" ]]
	then
		echo "$html exists"
		exit 1
	else
		mv "$file" "$html"
	fi
done
