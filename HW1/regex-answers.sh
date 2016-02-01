#!/bin/bash
# Corwin Sheahan

function usage
{
	echo "Usage: regex-answers.sh filename"
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


