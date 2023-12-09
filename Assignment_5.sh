#!/bin/bash

MAX=95
EMAIL=server@127.0.0.1
PART=sda1

# Extract the usage percentage, making sure to handle the case where the partition is not found
DF_OUTPUT=$(df -h)
USE=$(echo "$DF_OUTPUT" | awk -v part="$PART" '$NF==part {print $(NF-1)}' | sed 's/%//')

# Debug statement to print the actual output of the df command
echo "df output:"
echo "$DF_OUTPUT"

# Check if USE is a valid number
if [[ "$USE" =~ ^[0-9]+$ ]]; then
    # Compare the integer value with the maximum threshold
    if [ "$USE" -gt "$MAX" ]; then
        echo "Percent used: $USE" | mail -s "Running out of disk space" "$EMAIL"
    fi
    
fi