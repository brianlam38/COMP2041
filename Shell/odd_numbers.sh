#/bin/sh

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

