#!/bin/bash

# Check if the URL is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from the command line argument
url=$1

# Use curl to send an OPTIONS request and display the allowed methods
allowed_methods=$(curl -s -X OPTIONS -i "$url" | grep -i "allow" | cut -d' ' -f2-)

# Display the allowed HTTP methods
echo "Allowed HTTP Methods for $url:"
echo "$allowed_methods"
