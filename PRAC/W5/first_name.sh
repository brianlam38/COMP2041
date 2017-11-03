#!/bin/sh

file=$1

cat $file | egrep 'COMP[29]041' | cut -d' ' -f2 | sed 's/.*|.*|//' | sort | uniq -c | sort -n | tail -1 | sed 's/[0-9]//g' | sed 's/ //g'
