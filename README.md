# Linux Server Monitoring Project

## Project Overview
This project is a Bash-based Linux server monitoring solution developed on an Ubuntu EC2 instance. It monitors system information, CPU usage, memory usage, and disk utilization. The monitoring tasks are automated using Cron and their output is stored in log files.

## Objectives
- Monitor Linux server health.
- Track CPU and memory utilization.
- Monitor disk space usage.
- Generate system reports.
- Automate monitoring using Cron.
- Maintain logs for troubleshooting.

## Technologies Used
- Linux (Ubuntu)
- AWS EC2
- Bash Shell Scripting
- Cron
- AWK
- `top`, `free`, `df`, `ps`
- `bc`

## Project Structure

```text
linux-monitoring-project/
├── scripts/
│   ├── system_info.sh
│   ├── cpu_monitor.sh
│   ├── memory_monitor.sh
│   └── master_monitor.sh
├── reports/
│   ├── system_report.txt
│   └── timestamped reports
└── logs/
    └── monitor.log
```

## Monitoring Features

### System Information
Collects system details, CPU information, memory utilization, disk usage, and process information.

### CPU Monitoring
- Calculates CPU utilization.
- Uses an 80% threshold.
- Displays HEALTHY or WARNING status.

### Memory Monitoring
- Calculates memory utilization.
- Uses an 80% threshold.
- Displays HEALTHY or WARNING status.

### Disk Monitoring
Uses `df -h /` to display disk utilization of the root filesystem.

### Master Monitoring Script
Integrates system information, CPU, memory, and disk monitoring into a single script.

### Cron Automation
The master monitoring script is scheduled to run every five minutes.

### Logging
Monitoring output is appended to `logs/monitor.log`.

## Cron Schedule

```bash
*/5 * * * * cd /home/ubuntu/linux-monitoring-project && bash scripts/master_monitor.sh >> /home/ubuntu/linux-monitoring-project/logs/monitor.log 2>&1
```

## How to Run

Run individual monitoring scripts:

```bash
bash scripts/system_info.sh
bash scripts/cpu_monitor.sh
bash scripts/memory_monitor.sh
```

Run the complete monitoring solution:

```bash
bash scripts/master_monitor.sh
```

View monitoring logs:

```bash
tail -n 30 logs/monitor.log
```

## Learning Outcomes
- Linux system administration fundamentals.
- Bash scripting and automation.
- CPU, memory, and disk monitoring.
- Cron scheduling.
- Log management and troubleshooting.
- Hands-on experience with an Ubuntu EC2 server.

## Project Status
Completed — Linux server monitoring and Cron automation verified.
