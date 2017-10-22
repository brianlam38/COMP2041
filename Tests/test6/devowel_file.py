#!/usr/bin/python3

import re

f = open("frost.txt", "r")

data = f.readlines()

final = []
for line in data:
	line = re.sub(r"[aeiouAEIOU]","",line)
	final.append(line)

f.close()

f = open("frost.txt", "w")
f.close()

f = open("frost.txt", "w")
for line in final:
	f.write(line)
f.close()
