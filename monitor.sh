#!/bin/bash

LOGFILE="/var/log/syslog"
SIZE=$(du -m $LOGFILE | cut -f1)
SIZE=$((SIZE+0))  # ensure integer

BACKUP_DIR="/home/alka/log-monitor/backups"

# make backup dir if not exist
mkdir -p $BACKUP_DIR

# Conditional check
if [ $SIZE -gt 1 ]; then
    TIMESTAMP=$(date +%F-%H%M)
    BACKUP_FILE="$BACKUP_DIR/syslog-$TIMESTAMP.log"
    cp $LOGFILE $BACKUP_FILE       # copy log to backup
    echo "WARNING: $LOGFILE is too big ($SIZE MB), backup saved as $BACKUP_FILE"
else
    echo "Log size OK ($SIZE MB)"
fi
