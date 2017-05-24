#!/bin/bash 

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
        echo "Router Online"
	echo "Finding online hosts"
	if [[ $(nmap -sP 192.168.0.0/24 >/dev/null && arp -an | grep ac:22:0b:25:ec:34 | awk '{print $4}' | sed 's/[()]//g') ]] ; then
		echo "TRUE" > ~/Desktop/dos/ethernetin.txt
		echo "TRUE"
	else
		echo "FALSE" > ~/Desktop/dos/ethernetin.txt
		echo "FALSE"
	fi
else
        echo "Router Offline"
fi
