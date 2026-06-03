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

water_audit() {
    log_file="active_logs/water_usage_log.log"

    if [ ! -f active_logs ]; then
        echo "The logs directory is missing"
        return 1
    fi

    average=$(awk -F' \\| ' '
        $2 == "ICU_WATER_RESERVE" {
            sum += $3
            count++
        }
        END {
            if (count > 0)
                print sum / count
            else
                print 0
        }
    ' "$log_file")

    total_records=$(awk -F' \\| ' '
        $2 == "ICU_WATER_RESERVE" {
            count++
        }
        END {
            print count
        }
    ' "$log_file")

    printf "\n"
    printf "\n"
    printf "water audit  REPORT summary\n"
    printf "\n"
    printf "%-20s : %s\n" "Resource" "ICU_WATER_RESERVE"
    printf "%-20s : %d\n" "Records Analysed" "$total_records"
    printf "%-20s : %.2f Litres\n" "Average Usage" "$average"
    printf "%-20s : %s\n" "Generated" "$(date)"
    printf "===============================================\n"
}


# Executing our functions

process_vitals
echo ""
water_audit
