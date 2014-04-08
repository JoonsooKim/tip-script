#!/bin/bash

REV_1=$1
REV_2=$2

if [ "$1" = "" ]; then
	echo "rev should be specified"
	exit 0
fi

if [ "$2" = "" ]; then
	echo "rev should be specified"
	exit 0
fi

echo "WARNING: Be sure that kernel repository is on master branch"
echo ""

echo "kernel lge statistics"
echo "from: $REV_1"
echo "to: $REV_2"

cd /home/js1304/Projects/remote_git/linux;
git rev-list --author=lge.com --author="Minchan Kim" --author="Namhyung Kim" --no-merges --count $REV_1..$REV_2
