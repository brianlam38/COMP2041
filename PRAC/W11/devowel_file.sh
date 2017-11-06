#!/bin/sh

file=$1

content=`cat $file | sed 's/[aeiouAEIOU]//g'`

# removing old file contents
> $file

echo "$content" >> $file

