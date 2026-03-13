#!/usr/bin/env zsh



# =====================================================
# System Health Monitor
# 
# Purpose:
# A basic checking tool that checks system health.
# Designed to simulate monitoring tasks in production
# environments
#
# Metrics checked
# - CPU usage
# - Memory usuage
# - Dsik usage
# - System load
# - Critical services
#
# =====================================================


set -euo pipefail

# -----------------------------------------------------
# Configurable thresholds

# -----------------------------------------------------

CPU_WARNING=70
CPU_CRITICAL=90
DISK_WARNING=85



# -----------------------------------------------------
# Function: check_cpu
#
# mac does not peovide simple cpu percentaghe cmd
# run top ro get cpu usage snapshot
# -----------------------------------------------------

check_cpu() {

    # Extract idle percentage
    cpu_idle=$(top -l 1| grep "CPU usage" | awk '{print $7}' | tr -d '%')
    # Calculate usage
    cpu_usage=$((100 - ${cpu_idle%.*}))

    # Conver to integer
    cpu_usage=${cpu_usage%.*}

    echo "CPU Usage: ${cpu_usage}%"

    if [ "$cpu_usage" -gt "$CPU_CRITICAL" ]; then
        echo "CRITICAL: CPU usage above ${CPU_CRITICAL}%"
    elif [ "$cpu_usage" -gt "$CPU_WARNING" ]; then
        echo "WARNING: CPU usage above ${CPU_WARNING}%"
    fi
}


# -----------------------------------------------------
# Function: check_memory
#
# estimate memory pressure by using free vs active pages
# -----------------------------------------------------

check_memory() {

    page_size=4096

    free_pages=$(vm_stat | awk '/Pages free/ {print $3}' | tr -d '.')
    active_pages=$(vm_stat | awk '/Pages active/ {print $3}' | tr -d '.')

    free_mem=$((free_pages * page_size / 1024 / 1024))
    active_mem=$((active_pages * page_size / 1024 / 1024))

    echo "Memory Free: ${free_mem} MB"
    echo "Memory Active:${active_mem}  MB"


}

# -----------------------------------------------------
# Function: check_disk
#
# focus on root extraction (/)
# awk extarcts col 5 -> percentage used
# -----------------------------------------------------

check_disk() {
    
    disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "Disk Usage (/): ${disk_usage}%"

    if [ "$disk_usage" -gt "$DISK_WARNING" ]; then
        echo "WARNING: Disk usage aboce ${DISK_WARNING}%"
    fi

}


# -----------------------------------------------------
# Fucntion: check_load
#
# uptime prints system load averages
# 1,5,15 min
#
# -----------------------------------------------------

check_load() {

    load=$(uptime | awk -F'load averages:' '{print $2}' | xargs)

    echo "System Load (1m,5m,15m): $load"
}


# -----------------------------------------------------
# Function: check_services
#
# check if critical servicesare running
#  pgrep returns PID if running
#
# -----------------------------------------------------

check_services() {

    services=("docker" "sshd")

    echo "Service Status"

    for service in "${services[@]}"
    do 
        if pgrep -f "$service" > /dev/null
        then
            echo " $service running"
        else
            echo "$service NOT running"
        fi
    done
                
}


# -----------------------------------------------------
# Main Execution
# -----------------------------------------------------

echo "=============================="
echo "System Health Check"
echo "Time: $(date)"
echo "=============================="

check_cpu
echo

check_memory
echo

check_disk
echo

check_load
echo

check_services
echo

echo
echo "Health check complete."
