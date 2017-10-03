#!/usr/bin/python3

import sys

args = sys.argv
dictionary = {}

for arg in args:
	if arg == sys.argv[0]:
		continue
	if arg in dictionary:
		continue
	print(arg)
	dictionary[arg] = 0

