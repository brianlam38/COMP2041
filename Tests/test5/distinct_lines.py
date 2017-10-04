#!/usr/bin/python3

import sys
import re

start = 0
total = 0

ctr = sys.argv[1]; ctr = int(ctr)

array = []

for line in sys.stdin:
	line = line.replace("\n", "")
	array.append(line)

array_size = len(array)

dictionary = {}
while start < ctr:
	total += 1
	line = array[start]
	print(line)
	line = re.sub(r"\s*", r" ", line)
	line = line.replace("\n", "")
	print(array)
	if line in dictionary:
		continue
	dictionary[line] = 0
	start += 1


if start == int(ctr):
	print(str(start) + " distinct lines seen after " + str(total) + " lines read.")
else:
	start = str(start)
	start = start.replace(" ", "")
	print("End of input reached after " + str(ctr) + " lines read - " + str(array_size) + " different lines not seen.")	




