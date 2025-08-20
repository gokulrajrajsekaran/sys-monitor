#!/bin/bash

TIMESTAMP=$(date)

LOG_DIR=/home/gokul_1370/sys-monitor

# Save command history
echo -e "----$TIMESTAMP----" > $LOG_DIR/history.log
cat ~/.bash_history >> $LOG_DIR/history.log

# Save CPU & memory usage
echo -e "\n----$TIMESTAMP----" >> $LOG_DIR/report.txt
echo -e "Memory Usage (MB):" >> $LOG_DIR/report.txt
/usr/bin/free -m >> $LOG_DIR/report.txt
echo -e "\nCPU usage (Top 5 Processes):" >> $LOG_DIR/report.txt
/usr/bin/top -b -n1 | head -n 10 >>  $LOG_DIR/report.txt

# Push to GitHub
cd $LOG_DIR
/usr/bin/git add .
/usr/bin/git commit -m "Reports Updated at: $TIMESTAMP"
/usr/bin/git push origin main


