#!/bin/bash

TIMESTAMP=$(date +%Y%m%d_%H%M)
echo "Timestamp generated: ${TIMESTAMP}"


echo " Checking directories..."
if [ ! -d "active_logs" ]; then
    echo "Active_logs directory is missing"
    return 1
fi

for file in heart_rate temperature water_usage; do
    echo "Archiving ${file}_log.log..."
    
    mv "active_logs/${file}_log.log" "archived_logs/${file}_${TIMESTAMP}.log"
    
    echo "recreating ${file}.log"
    touch "active_logs/${file}_log.log"
    echo "Recreated: active_logs/${file}.log"
done

echo ""
echo "Logs archived successfully at ${TIMESTAMP}"
