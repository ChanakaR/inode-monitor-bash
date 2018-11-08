#!/bin/bash
current=$(df -ih /tmp | grep / | awk '{ print $5}' | sed 's/%//g')
threshold=90
alerted=0

if [[ "$current" -gt "$threshold" && "$alerted" -eq "0" ]] ; then
    alerted=1
    cat mail_header.txt > mail_body.txt
    echo "Subject: INode Usage Alert" >> mail_body.txt
    echo "INode usage of /tmp directory is critically high. Please run 'df -ih /tmp' to see the usage summary" >> mail_body.txt
else
    if [[ "$alerted" -eq "1" ]] ; then
        alerted=0
        cat mail_header.txt > mail_body.txt
        echo "Subject: INode Usage Alert Cleared" >> mail_body.txt
        echo "INode high usage alert has been cleared. Please run 'df -ih /tmp' to see the usage summary" >> mail_body.txt
    fi
fi