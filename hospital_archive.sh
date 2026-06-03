#!/bin/bash

TIMESTAMP=$(date +%Y%m%d_%H%M)

mv active_logs/heart_rate.log archived_logs/heart_rate_${TIMESTAMP}.log
mv active_logs/temperature.log archived_logs/temperature_${TIMESTAMP}.log
mv active_logs/water_usage.log archived_logs/water_usage_${TIMESTAMP}.log
touch active_logs/heart_rate.log 
touch active_logs/temperature.log
touch active_logs/water_usage.log

echo "Logs archived successfully at ${TIMESTAMP}
