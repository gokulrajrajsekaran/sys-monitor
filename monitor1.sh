#!/bin/bash
cd /home/gokul_1370/sys-monitor || exit 1   # change to your repo folder

LOGFILE="report.txt"
CRONLOG="/home/gokul_1370/sys-monitor/cron.log"

{
    echo "===== $(date) ====="
    echo "---- Command History ----"
    history | tail -n 20
    echo
    echo "---- CPU & RAM ----"
    top -b -n 1 | head -n 5
    echo "-------------------------"
} >> "$LOGFILE"

# Git operations
{
    /usr/bin/git add "$LOGFILE"
    /usr/bin/git commit -m "Update at $(date)"
    /usr/bin/git push origin main
    echo "[SUCCESS] $(date) - Data pushed to GitHub"
} >> "$CRONLOG" 2>&1
