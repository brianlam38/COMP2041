#!/usr/bin/python

import sys
import re

for line in sys.stdin:
        line = line.replace("\n", "")
        array = line.split(" ")
        final_str = ""
        # each word in line
        for i in array:
                chars = list(i)
                # count each char occurrnece
                equi_word = {}
                for c in chars:
                        c = c.lower()
                        if c in equi_word:
                                equi_word[c] += 1
                        else:
                                equi_word[c] = 0
                # check if equi_word
                equi = 0
                for key, val in equi_word.items():
                        if val != equi_word.items()[0][1]:
                                equi = 1
                # word = equi_world, add to final str
                if equi is 0:
                        final_str += i + " "
        # print equi_word str
        print(final_str)

