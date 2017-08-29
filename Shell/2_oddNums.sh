#/bin/sh

# This script prints all odd numbers between 1..99

i=1
while [ $i -le 99 ]
do
	num=$(($i % 2))
	#echo $num
    if [ $num -ne 0 ]
    then
        echo $i
    fi
    i=$(($i + 1))
done