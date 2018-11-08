#!/bin/bash
CURRENT=$(df -ih /tmp | grep /tmp | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=10
ALERTED=0

echo $CURRENT

if [[ $CURRENT -gt $THRESHOLD ]]
 then
   if [[ALERTED -eq 0]]
     then
       mail -s 'Artemis - INode usage Alert' example@example.com << EOF
   tmp partition remaining free INodes value is critically low. Used: $CURRENT%
EOF
       ALERTED=1
   fi
 else
   if [[ALERTED -eq 1]]
     then
       mail -s 'Artemis - INode usage Alert Cleared' example@example.com << EOF
   tmp partition remaining free INodes usage alert has been cleared. Used: $CURRENT%
EOF
       ALERTED=0
   fi
fi
