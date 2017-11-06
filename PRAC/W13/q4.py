#!/usr/bin/python

import sys
import re

for line in sys.stdin:
	line = line.replace("\n", "")
	array = line.split(" ")
	string = ""
	for i in array:
		if re.search(r"[0-9]+\.[0-9]+", i):
			new_num = re.sub(r"[^0-9.]", "", i)
			new_num = float(new_num)
			new_num = round(new_num)
			new_num = str(new_num)
			new_num = re.sub(r"\..*", "", new_num)
			i = re.sub(r"[0-9]+\.[0-9]+", new_num, i)
			string += i + " "
		else:
			string += i + " "	
	print(string)
