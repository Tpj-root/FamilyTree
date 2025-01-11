#!/bin/bash

# Loop through all .ico files in the current directory
for file in *.ico; do
    # Check if the file contains a 128x128 resolution
    if identify "$file" | grep -q "128x128"; then
        # Find the index of the 128x128 resolution
        index=$(identify "$file" | grep -n "128x128" | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')
        echo "Extracting 128x128 image from $file (Index: $index)"
        
        # Extract the 128x128 resolution as a PNG
        convert "$file"[$index] "${file%.ico}_128x128.png"
    else
        echo "No 128x128 resolution found in $file. Skipping."
    fi
done

