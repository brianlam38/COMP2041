#!/usr/bin/python

import sys
import re

array = sys.argv[1:]
array = sorted(array, key=int)

#print(array)

num_args = len(array)
num_args = num_args / 2;

print(array[num_args])
