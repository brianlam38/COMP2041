#!/usr/bin/python3

import sys

# grab list of cmd-line args
args = sys.argv
dictionary = {}

# for each arg, skip filename
for arg in args:
	if arg == sys.argv[0]:
		continue
	if arg in dictionary:
		continue
	dictionary[arg] = 0
	print(arg + " ", end="")
print()