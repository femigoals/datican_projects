#!/bin/bash

MAX=95
EMAIL=server@127.0.0.1

# Calculate CPU usage and round to the nearest integer
USE=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}')

# Debug statement to print the calculated CPU usage
echo "Calculated CPU Usage: $USE"

# Compare the integer value with the maximum threshold
if [ "$USE" -gt "$MAX" ]; then
    echo "Percent used: $USE" | mail -s "Running out of CPU power" "$EMAIL"
    echo "Email sent."
else
    echo "CPU usage below threshold."
fi
