#!/usr/bin/python

import sys
import re

n = sys.argv[1]
n = int(n)
read = 0
distinct = 0

seen = {}
for line in sys.stdin:
	line = re.sub(r"\s", "", line)
	line = line.lower()
	if line not in seen:
		#print("DISTINCT LINE = {}".format(line))
		seen[line] = 0
		distinct += 1
	read += 1
	if n == distinct:
		print("{} distinct lines seen after {} lines read.".format(distinct, read))
		sys.exit()

print("End of input reached after {} lines read -  {} different lines not seen.".format(read, n))



