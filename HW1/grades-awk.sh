#!/bin/bash
# Corwin Sheahan

function usage
{
	echo "Usage: grades-awk.sh filename"
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

cat $filename | sort -k 3,3 -k 2,2 -k 1,1 |awk 'BEGIN {}
{
	avg[NR]=($4 + $5 + $6)/3;
	ID[NR]=$1;
	lastName[NR]=$3;
	firstName[NR]=$2;
}
END {
	for( n=1; n <= NR; n++ ) 
		{print avg[n], "["ID[n]"]", lastName[n]", "firstName[n]}
}' 
