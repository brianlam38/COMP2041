#!/usr/bin/sh

echo My program name is $0				# $0 = name of the comand
echo My process number is $$			# $$ = process ID of this shell (uniq no. to ID an active process)
echo I have $# arguments				# $# = count no. of arguments
echo My arguments separate are $*		# $* = all args separately (as separate strings)
echo My arguments together are "$@"		# $@ = all args together (as one string)
echo My 5th argument is "$5"			# #5 = 5th arg