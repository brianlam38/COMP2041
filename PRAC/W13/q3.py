#!/usr/bin/python

import sys

final_str = ""
seen = {}
for arg in sys.argv[1:]:
	if arg in seen:
		continue
	seen[arg] = 0
	final_str += arg + " "

print(final_str)
