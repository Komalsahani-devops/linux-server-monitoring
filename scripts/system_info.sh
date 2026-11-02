#!/bin/bash

echo "================================"
echo "       LINUX SYSTEM REPORT"
echo "================================"

echo ""
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"

echo ""
echo "===== DISK USAGE ====="
df -h

echo ""
echo "===== MEMORY USAGE ====="
free -h

echo ""
echo "===== CPU INFORMATION ====="
echo "CPU Architecture: $(lscpu | awk -F: '/Architecture/ {print $2}' | xargs)"
echo "CPU Count: $(nproc)"
echo "CPU Model: $(lscpu | awk -F: '/Model name/ {print $2}' | xargs)"

echo ""
echo "===== TOP CPU PROCESSES ====="
ps aux --sort=-%cpu | head -6

echo ""
echo "===== TOP MEMORY PROCESSES ====="
ps aux --sort=-%mem | head

echo ""
echo "===== SYSTEM HEALTH CHECK ====="

disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

echo "Disk Usage: ${disk_usage}%"
echo "Memory Usage: ${memory_usage}%"

if [[ "$disk_usage" -gt 80 || "$memory_usage" -gt 80 ]]; then
    echo "SYSTEM STATUS: WARNING"
else
    echo "SYSTEM STATUS: HEALTHY"
fi
