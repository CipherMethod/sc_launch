#!/bin/sh
# Created by Jamey Hopkins
#
#20120606 - Launch SC Streaming Services
#20141109 - Added check if running in order to cron launch after a reboot
#20191122 - Use pgrep
#20220621 - Expand pgrep from sc_ to sc_serv
#           A more better display of what's running
#           Better process count maths

HOME="/home/sc"

cd $HOME
echo "Process List:"
ps -ef | grep sc_serv
#pgrep sc_serv
COUNT=`pgrep sc_serv | wc -l`
echo "Process count: $COUNT"
if [ "$COUNT" -gt 0 ]; then
   echo Shoutcast appears to be already running...
else
   echo "Starting SHOUTcast instance"
   sc2.6.0/sc_serv serv.conf &
   sleep 2
   ./sc_trans trans.conf &
fi

