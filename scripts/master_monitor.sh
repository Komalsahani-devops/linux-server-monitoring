#!/bin/bash

echo "================================"
echo "      SYSTEM MONITORING"
echo "================================"

echo ""
echo "===== SYSTEM INFORMATION ====="
bash scripts/system_info.sh

echo ""
echo "===== CPU MONITORING ====="
bash scripts/cpu_monitor.sh

echo ""
echo "===== MEMORY MONITORING ====="
bash scripts/memory_monitor.sh

echo ""
echo "===== DISK MONITORING ====="
df -h /

echo ""
echo "===== MONITORING COMPLETED ====="
