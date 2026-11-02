#!/bin/bash

echo "===== CPU MONITORING ====="
echo ""
cpu_usage=$(top -bn1 | awk -F'[, ]+' '/Cpu\(s\)/ {for(i=1;i<=NF;i++) if($i=="id") idle=$(i-1); print 100-idle}')
echo "CPU Usage: ${cpu_usage}%"
threshold=80
echo ""

if (( $(echo "$cpu_usage > $threshold" | bc -l) )); then
    echo "CPU STATUS: WARNING"
else
    echo "CPU STATUS: HEALTHY"
fi
