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

echo "WARNING: Be sure that repository is on master branch"
echo ""

echo "chromium lge statistics"
echo "from: $REV_1"
echo "to: $REV_2"

cd /home/js1304/Projects/remote_git/chromium;
git log --author=lge.com --author="simon.hong81@gmail.com" --author="simonhong@chromium.org" --no-merges --oneline --since=$REV_1 --until=$REV_2 | wc
