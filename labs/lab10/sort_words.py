#!/usr/bin/python3

import sys

# read in line by line
for line in sys.stdin.readlines():
	line = line.replace("\n", " ")
	#print(line, end="")
	array = line.split(" ")
	array.sort()
	#print(array)
	for item in array:
		if item == "":
			continue
		print(item + " ", end="")
	print()


