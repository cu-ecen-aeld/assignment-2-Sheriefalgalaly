#!/bin/bash

# Check if both arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required - writefile and writestr"
    exit 1
fi

writefile="$1"
writestr="$2"

# Extract the directory path from the full file path
dirpath=$(dirname "$writefile")

# Create the directory path if it doesn't exist
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $dirpath"
        exit 1
    fi
fi

# Write the content to the file (overwrites if exists)
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi

exit 0
