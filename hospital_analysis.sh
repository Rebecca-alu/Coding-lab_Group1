#!/bin/bash

process_vitals() {

   	echo "Analyzing critical vitals....."
    	> reports/critical_alerts.txt

	for file in heart_rate_log temperature_log; do

    		grep "CRITICAL" active_logs/"$file".log \
		| awk -F',' '{print $1","$2","$3}' \
    		>> reports/critical_alerts.txt
	done

    echo "Report created for CRITICAL Vitals"
}
