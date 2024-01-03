#!/bin/bash

set -e

LIST1=`mktemp`
LIST2=`mktemp`
echo "Getting list of current devices..."
find /sys/devices -name speed | sort > "$LIST1"
echo -n "Now plug the relevant USB device and press ENTER..."
read dummy
find /sys/devices -name speed | sort > "$LIST2"

comm -3 "$LIST1" "$LIST2" | while read f ; do
echo -n "$f" " "
cat "$f"
done | column -t -s' '

rm  "$LIST1" "$LIST2"
