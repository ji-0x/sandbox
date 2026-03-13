# System Health Monitor

A simple system health monitoring script written in **Zsh** that checks key system metrics on macOS.

The script provides a quick snapshot of system health by inspecting CPU usage, memory usage, disk utilization, system load, and critical services.

---

## Overview

`healthcheck.sh` is a simple monitoring utility designed to simulate basic system monitoring tasks commonly used in production environments.

It performs checks on:

* CPU usage
* Memory statistics
* Disk usage
* System load averages
* Critical service availability

The script outputs warnings when configured thresholds are exceeded.

---

## Requirements

* macOS
* Zsh
* Standard UNIX utilities:

  * `top`
  * `vm_stat`
  * `df`
  * `uptime`
  * `awk`
  * `pgrep`

---

## Installation

Clone the repository:

```bash
git clone https://github.com/ji-0x/sandbox.git
cd sandbox
./toolbox/system-health/healthcheck.sh
```

Make sure the script executable:

```bash
chmod +x healthcheck.sh
```

---

## Configuration

Threshold values can be adjusted inside the script:

```bash
CPU_WARNING=70
CPU_CRITICAL=90
DISK_WARNING=85
```

These values determine when warning or critical alerts are triggered.

The list of monitored services can also be modified:

```bash
services=("docker" "sshd")
```

---

## Usage

Run the script directly:

```bash
./healthcheck.sh
```

---

## Example Output

```
==============================
System Health Check
Time: Fri Mar 13 21:47:02
==============================

CPU Usage: 24%

Memory Free:   1432 MB
Memory Active: 5211 MB

Disk Usage (/): 61%

System Load (1m,5m,15m): 1.42 1.37 1.31

Service Status
  docker     running
  sshd       running

Health check complete.
Overall Status: OK
```

---

## Automation Example

Run the script periodically using cron:

```bash
*/5 * * * * /path/to/healthcheck.sh
```

This executes the health check every 5 minutes.

---

## Troubleshooting

**CPU usage parsing fails**

Verify the format of the `top` command output on your system.

**Service status always shows not running**

Ensure the service name matches the process name returned by `pgrep`.

---

## License


