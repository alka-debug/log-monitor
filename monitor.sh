#!/bin/bash

# define which log to monitor
LOGFILE="/var/log/syslog"

# check its size
SIZE=$(du -h $LOGFILE | cut -f1)
#SIZE=$((SIZE+0)) # ensure integer

BACKUP_DIR="/home/cupcake/log-monitor/backups"

# make backup dir if not exist
mkdir -p $BACKUP_DIR

# conditional check
if [ $SIZE -gt 1 ]; then
    TIMESTAMP=$(date +%F-%H%M)
    BACKUP_FILE="$BACKUP_FILE/syslog-$TIMESTAMP.log"
    cpp $LOGILE $BACKUP_FILE # copy log to backup
  echo "WARNING: $LOGFILE is too big ($SIZE ), backup saved as $BACKUP_FILE"
else
  echo "Log size is chill:) ($SIZE )"
fi
