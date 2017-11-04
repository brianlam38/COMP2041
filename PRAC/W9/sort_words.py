#!/usr/bin/python

import sys
import re

for line in sys.stdin:
	array = []
	line = line.replace("\n", "")
	array = line.split(" ")
	array.sort()
	string = ""
	for i in array:
		if i == "":
			continue;
		#print("ITEM = {}".format(i))
		string += i + " "
	print(string)
