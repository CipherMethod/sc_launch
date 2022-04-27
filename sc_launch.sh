#!/bin/sh
# Created by Jamey Hopkins
#
#20120606 - Launch SC Streaming Services
#20141109 - Added check if running in order to cron launch after a reboot
#20191122 - Use pgrep

cd /home/sc
COUNT=`pgrep sc_ | wc -l`
if [ "$COUNT" -ge 2 ]; then
   echo Shoutcast appears to be already running...
else
   sc2.6.0/sc_serv serv.conf &
   sleep 2
   ./sc_trans trans.conf &
fi

