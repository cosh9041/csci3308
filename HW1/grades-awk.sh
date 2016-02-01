#!/bin/bash
# Corwin Sheahan

function usage
{
	echo "Usage: grades.sh filename"
	exit $?
}

awk '
BEGIN { print "START" }
      { print         }
END   { print "STOP"  }
'

awk '{print "File\tOwner" } { print "here", "\t"}'
echo "here"

if [ $# -lt 1 ]; then
	usage
else
	if [ $# -gt 1 ]; then
	usage
	else
		filename=$1
	fi
fi

