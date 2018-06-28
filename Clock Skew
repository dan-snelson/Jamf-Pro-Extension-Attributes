#!/bin/sh

result=$( /usr/sbin/ntpdate -q time.apple.com | /usr/bin/awk '{print $6}' | /usr/bin/head -1 | /usr/bin/sed 's/-//;s/,$//' )

echo "<result>${result}</result>"

exit 0
