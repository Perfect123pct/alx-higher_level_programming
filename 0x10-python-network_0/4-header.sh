#!/bin/bash

# Check if the URL is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from the command line argument
url=$1

# Use curl to send a GET request with a custom header and display the body
response=$(curl -s -H "X-School-User-Id: 98" "$url")

# Display the body of the response
echo "Response Body:"
echo "$response"

