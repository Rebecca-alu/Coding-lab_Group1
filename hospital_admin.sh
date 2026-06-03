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


echo "Welcome to KNH admin system"
echo ""
echo "What do you want to do: "
echo""
echo "1) Initiliaze the system"
echo "2) Secure the hospital data"
read option

if (( option == 1 )); then
    initialize_system
elif (( option == 2 )); then
    secure_data
else
    echo "Wrong inpurt. Allowed to use only 1 and 2"
fi
