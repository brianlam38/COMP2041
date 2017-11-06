#!/usr/bin/python

import sys
import re

file = open(sys.argv[1])
array = []
for line in file:
	line = re.sub(r"[aeiouAEIOU]", "", line)
	array.append(line)
file.close()

# remove file contents
file = open(sys.argv[1], 'w')
file.close()

# append devoweled lines
file = open(sys.argv[1], 'a')
for line in array:
	file.write(line)
