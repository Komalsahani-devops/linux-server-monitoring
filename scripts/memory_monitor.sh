#!/bin/bash

echo "===== MEMORY MONITORING ====="
echo ""

memory_usage=$(free | awk '/Mem:/ {printf "%.1f", $3/$2 * 100}')

echo "Memory Usage: ${memory_usage}%"

threshold=80

echo ""

if (( $(echo "$memory_usage > $threshold" | bc -l) )); then
    echo "MEMORY STATUS: WARNING"
else
    echo "MEMORY STATUS: HEALTHY"
fi
