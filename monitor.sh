#!/bin/bash

TIMESTAMP=$(date)

echo -e "----$TIMESTAMP----" > ~/sys_monitor/history.log
cat ~/.bash_history >> ~/sys_monitor/history.log


echo -e "\n----$TIMESTAMP----" >> ~/sys_monitor/report.log
echo -e "Memory Usage(MB):" >> ~/sys_monitor/report.log
free -m >> ~/sys_monitor/report.log
echo -e "\nCPU usage (Top 5 Processes):" >> ~/sys_monitor/report.log
top -b -n1 | head -n 10 >>  ~/sys_monitor/report.log

cd ~/sys_monitor
git add .
git commit -m "Reports Updated at: $TIMESTAMP"
git push origin main

