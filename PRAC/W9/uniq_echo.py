#!/usr/bin/python

import re
import sys

seen = {}
answer = ""
for arg in sys.argv[1:]:
	if arg in seen:
		continue
	answer = answer + arg + " "
	seen[arg] = 0

print(answer)
