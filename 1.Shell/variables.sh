#!/bin/sh

# Shell doesn't care about type in variables.
x=1
y=fred
echo $x$y
echo $xy # the aim is to display "1y"
echo "$x"y
echo ${x}y
echo ${j-10} # give value of j or 10 if no value
echo ${j=33} # set j to 33 if no value (and give £j)
echo ${x:?No Value} # display "No Value" if £x not set
echo ${xx:?No Value} # display "No Value" if £xx not set

