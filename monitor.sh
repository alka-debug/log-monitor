#!/bin/bash

# define which log to monitor
LOGFILE="/var/log/syslog"

# check its size
SIZE=$(du -m $LOGFILE | cut -f1)
SIZE=$((SIZE+0))

# conditional check
if [ $SIZE -gt 1 ]; then
  echo "WARNING: $LOGFILE is too big ($SIZE mb)"
else
  echo "Log size is chill:) ($SIZE mb)"
fi
