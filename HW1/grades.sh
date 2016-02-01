#!/bin/bash
# Corwin Sheahan

function usage
{
	echo "Usage: grades.sh filename"
	exit $?
}

if [ $# -lt 1 ]; then
	usage
else
	if [ $# -gt 1 ]; then
	usage
	else
		filename=$1
	fi
fi
IFS=$'\n'
for line in $(cat filegrades.txt | sort -k 3,3 -k 2,2 -k 1,1); do
	num1=$(echo $line | cut -d' ' -f4)
	num2=$(echo $line | cut -d' ' -f5)
	num3=$(echo $line | cut -d' ' -f6)
	sum=$((num1+num2+num3))
	avg=$((sum/3))
	ID=$(echo $line | cut -d' ' -f1)
	lastName=$(echo $line | cut -d' ' -f3)
	firstName=$(echo $line | cut -d' ' -f2)
	echo $avg" ["$ID"] "$lastName", "$firstName
done
