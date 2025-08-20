#!/bin/bash
#define which log to monitor
LOGFILE="/var/log/syslog"
#check its size
SIZE=$(du -h $LOGFILE | cut -f1)
#print a message
echo "The size of $LOGFILE is $SIZE"
