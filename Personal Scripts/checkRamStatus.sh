#!bin/bash

echo "Checking..."
echo ""
free 
sleep 2
echo "------------------------------"
echo "" 
cat /proc/meminfo
sleep 2
echo "------------------------------"
echo "" 
ps -e -orss=,args= | sort -b -k1,1n | pr -TW$COLUMNS
sleep 2
echo "------------------------------"
echo ""
