#!/bin/bash

REV_1=$1
REV_2=$2
LOG_FILE=android_lge_stat
TMP_FILE=.android_lge_stat.tmp

if [ "$1" = "" ]; then
	echo "rev should be specified"
	exit 0
fi

if [ "$2" = "" ]; then
	echo "rev should be specified"
	exit 0
fi

echo "WARNING: Be sure that android repository is on master branch"
echo ""

echo "android lge statistics"
echo "from: $REV_1"
echo "to: $REV_2"
echo "log file: $LOG_FILE"

cd /home/js1304/Projects/remote_git/android;
./repo forall -c "pwd; git rev-list --author=lge.com --no-merges --count $REV_1..$REV_2 2> /dev/null" > $TMP_FILE
grep -B 1 ^[1-9][0-9]* $TMP_FILE | awk '{if($0!="--") print $0}' > $LOG_FILE


SYSTEM_DIR="system hardware device external"
FRAMEWORK_DIR="frameworks cts"
APP_DIR="packages"

rm $TMP_FILE
for dir in $SYSTEM_DIR; do
	grep -A 1 "android/$dir" $LOG_FILE | grep ^[1-9][0-9]* >> $TMP_FILE
done
awk '{sum += $1} END {print "system: " sum}' $TMP_FILE

rm $TMP_FILE
for dir in $FRAMEWORK_DIR; do
	grep -A 1 "android/$dir" $LOG_FILE | grep ^[1-9][0-9]* >> $TMP_FILE
done
awk '{sum += $1} END {print "framework: " sum}' $TMP_FILE

rm $TMP_FILE
for dir in $APP_DIR; do
	grep -A 1 "android/$dir" $LOG_FILE | grep ^[1-9][0-9]* >> $TMP_FILE
done
awk '{sum += $1} END {print "app: " sum}' $TMP_FILE

rm $TMP_FILE
