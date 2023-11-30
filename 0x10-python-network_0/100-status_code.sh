#!/bin/bash

# Check if the URL is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url=$1

# Use curl to send a request and display only the status code
curl -s -o /dev/null -w "%{http_code}\n" "$url"
