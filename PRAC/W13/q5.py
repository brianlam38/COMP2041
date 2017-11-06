#!/usr/bin/python

import sys
import re

array = []
for line in sys.stdin:
	line = line.replace("\n", "")
	array.append(line)

for line in array:
	if re.search(r"#[0-9]", line):
		index = re.sub(r"[^0-9]", "", line)
		index = int(index)
		line = array[index-1]
	print(line)
