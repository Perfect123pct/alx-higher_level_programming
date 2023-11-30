#!/bin/bash

# Check if the URL and filename are provided as arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <URL> <filename>"
    exit 1
fi

url=$1
filename=$2

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Use curl to send a JSON POST request with the contents of the file
response=$(curl -s -X POST -H "Content-Type: application/json" -d @"$filename" "$url")

# Display the body of the response
echo "Response Body:"
echo "$response"
