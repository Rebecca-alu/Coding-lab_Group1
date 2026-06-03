#!/bin/bash

initialize_system() {
    echo "============================================"
    echo "  KNH System Initialization"
    echo "============================================"
 
   
    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir -p active_logs
        echo "  [OK] active_logs created."
    else
        echo "  [EXISTS] active_logs already exists. Skipping."
    fi
 
    
    if [ ! -d "archived_logs" ]; then
        echo "Creating archived_logs directory..."
        mkdir -p archived_logs
        echo "  [OK] archived_logs created."
    else
        echo "  [EXISTS] archived_logs already exists. Skipping."
    fi
 
    # Check and create reports directory
    if [ ! -d "reports" ]; then
        echo "Creating reports directory..."
        mkdir -p reports
        echo "  [OK] reports created."
    else
        echo "  [EXISTS] reports already exists. Skipping."
    fi
 
    # Create placeholder log files so the Python engine can write to them
    touch active_logs/heart_rate.log
    touch active_logs/temperature.log
    touch active_logs/water_usage.log
    echo ""
    echo "  [OK] Log files initialized in active_logs/."
}

secure_data(){
# MEMBER 2 - The Security Lead: secure_data()
# Applies strict permissions to active_logs (owner read/write only)
# ─────────────────────────────────────────────────────────────
secure_data() {
    echo ""
    echo "============================================"
    echo "  KNH Security Configuration"
    echo "============================================"

    # chmod 600 = owner read+write only (rw-------)
    # This prevents other users or groups from reading sensitive medical logs
    echo "Applying permissions: owner read+write only on active_logs/..."
    chmod 600 active_logs/*.log     # Lock down individual log files
    chmod 700 active_logs           # Owner can enter directory; others cannot

    echo ""
    echo "Current permissions on active_logs/:"
    ls -l active_logs/
    echo ""
    echo "Explanation of permissions:"
    echo "  drwx------ on directory = only owner can read/write/enter"
    echo "  -rw------- on files    = only owner can read and write"
}
