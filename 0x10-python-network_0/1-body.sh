#!/bin/bash

# Check if the URL is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from the command line argument
url=$1

# Use curl to fetch the URL and only display the body for a 200 status code
response=$(curl -s -w "%{http_code}" "$url")

# Extract the status code
status_code="${response: -3}"

# Check if the status code is 200 (OK)
if [ "$status_code" -eq 200 ]; then
    # Extract and display the body of the response
    body=$(curl -s "$url")
    echo "Response Body:"
    echo "$body"
else
    echo "Error: Received status code $status_code. Unable to display response body."
fi
