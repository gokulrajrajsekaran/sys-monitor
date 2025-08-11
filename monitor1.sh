#!/bin/bash
cd /home/gokul_1370/sys-monitor   # change to your folder

LOGFILE="report.txt"

{
    echo "===== $(date) ====="
    echo "---- Command History ----"
    history | tail -n 20
    echo
    echo "---- CPU & RAM ----"
    top -b -n 1 | head -n 5
    echo "-------------------------"
} >> "$LOGFILE"

git add "$LOGFILE"
/usr/bin/git commit -m "Update at $(date)"
/usr/bin/git push origin master
