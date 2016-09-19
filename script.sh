#!/bin/bash

clear

exec 2> /dev/null

TIMEOUT=$(grep -o '[0-9][0-9]*' config.ini)

echo "Weather in Minsk:"

while true
do
	list=$(curl http://pogoda.tut.by/city/minsk -silent |
		grep '<span class="temp-i">' -m 1 |  
		sed -e 's/<span class="temp-i">//g' | 
		sed -e 's/&deg;<\/span><\/div>//g')
	echo "$list"
	sleep $TIMEOUT
done