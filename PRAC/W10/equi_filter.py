#!/usr/bin/python

import sys
import re

for line in sys.stdin:
	line = line.replace("\n", "")
	array = line.split(" ")
	final_str = ""
	# each word in line
	for i in array:
		#print("WORD = {}".format(i))
		chars = list(i)
		# count each char in word
		equi_word = {}
		for c in chars:
			c = c.lower()
			#print("CHAR = {}".format(c))
			if c in equi_word:
				equi_word[c] += 1
			else:
				equi_word[c] = 0
		# check if equi_word
		equi = 0
		for key, val in equi_word.items():
			#print("VAL = {}".format(val))
			if val != equi_word.items()[0][1]:
				equi = 1
		if equi is 0:
			final_str += i + " "
	print(final_str)	
