#!/usr/bin/python3

import sys

# grab list of args
args = sys.argv[1:]

sorted = []

# convert arg str -> int then push to sorted
for i in args:
	i = int(i)
	sorted.append(i)

# sort sorted array
sorted.sort()

# get median index
len = len(sorted)
len = len/2
len = int(len)

#print
print(sorted[len])
