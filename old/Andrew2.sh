#Check for changes on a website
curl http://127.0.0.1/ >output
while true
do
	cp output oldoutput
	curl http://127.0.0.1/ >output
	if diff output oldoutput
	then
		echo website changed
	fi
	sleep 1
done