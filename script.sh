#!/bin/bash
CURRENT=$(df -ih / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=10

echo "$CURRENT"

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    mail -s 'Disk Space Alert' example@example.com << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi
