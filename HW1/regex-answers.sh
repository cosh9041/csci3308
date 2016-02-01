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

# Number of lines ending in a number
cat $filename | egrep '[0-9]$' | wc -l

# Lines not starting with a vowel
cat $filename | egrep '^[^aeiouAEIOU]' | wc -l

# Lines with only 12 letters, alphabet only
cat $filename | egrep '^[a-zA-Z]{12}$' | wc -l

# Number of phone numbers in data set
cat $filename | egrep '[0-9]{3}-[0-9]{3}-[0-9]{4}' | wc -l

# Number of Boulder (303) phone numbers in data set
cat $filename | egrep '303-[0-9]{3}-[0-9]{4}' | wc -l

# Number of lines beginning with vowel and ending with number
cat $filename | egrep '^[aeiouAEIOU].*[0-9]$' | wc -l

# Number of geocities email addresses
cat $filename | egrep '.*@geocities\.com' | wc -l

# Number of incorrect email addresses
cat $filename | egrep '.*@\.' | wc -l
