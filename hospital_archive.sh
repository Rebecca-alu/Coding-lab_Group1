#!/bin/bash

TIMESTAMP=$(date +%Y%m%d_%H%M)
echo "Timestamp generated: ${TIMESTAMP}"


echo " Checking directories..."
if [ ! -d "active_logs" ]; then
    mkdir active_logs
    echo "created active_logs directory"
else
    echo "active_logs already exists"
fi

if [ ! -d "archived_logs" ]; then
    mkdir archived_logs
    echo "created archived_logs directory"
else
    echo "archived_logs already exists"
fi

echo " Creating files in active_logs..."
echo "Creating heart_rate.log..."
touch active_logs/heart_rate.log
echo "Created: active_logs/heart_rate.log"

echo "Creating temperature.log..."
touch active_logs/temperature.log
echo "Created: active_logs/temperature.log"

echo "Creating water_usage.log..."
touch active_logs/water_usage.log
echo "Created: active_logs/water_usage.log"

echo "Archiving heart_rate.log..."
mv active_logs/heart_rate.log archived_logs/heart_rate_${TIMESTAMP}.log
echo "Moved: heart_rate.log → archived_logs/heart_rate_${TIMESTAMP}.log"

echo "Archiving temperature.log..."
mv active_logs/temperature.log archived_logs/temperature_${TIMESTAMP}.log
echo "Moved: temperature.log → archived_logs/temperature_${TIMESTAMP}.log"

echo "Archiving water_usage.log..."
mv active_logs/water_usage.log archived_logs/water_usage_${TIMESTAMP}.log
echo "Moved: water_usage.log → archived_logs/water_usage_${TIMESTAMP}.log"

echo " Recreating log files in active_logs..."
for file in heart_rate temperature water_usage; do
    echo "recreating ${file}.log"
    touch active_logs/${file}.log
    echo "Recreated: active_logs/${file}.log"
done

echo "Logs archived successfully at ${TIMESTAMP}"
