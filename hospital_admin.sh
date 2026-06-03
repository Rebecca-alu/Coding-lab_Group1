#!/bin/bash
 # hospital_admin.sh
# KNH Digital Infrastructure - Environment Setup & Security
# Members: 1 (Architect), 2 (Security Lead), 3 (Orchestrator)
 
# ─────────────────────────────────────────────────────────────
# MEMBER 1 - The Architect: initialize_system()
# Creates required directory structure if not already present
# ─────────────────────────────────────────────────────────────
initialize_system() {
    echo "============================================"
    echo "  KNH System Initialization"
    echo "============================================"
 
    # Check and create active_logs directory
    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir -p active_logs
        echo "  [OK] active_logs created."
    else
        echo "  [EXISTS] active_logs already exists. Skipping."
    fi
 
    # Check and create archived_logs directory
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
