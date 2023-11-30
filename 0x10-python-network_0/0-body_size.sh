#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url=$1

# Use curl to send a request and get the size of the response body in bytes
size=$(curl -sI "$url" | grep -i content-length | awk '{print $2}')

# Display the size of the response body
echo "Size of the response body: ${size} bytes"
