#!/bin/bash

# Check if the URL is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Get the URL from the command line argument
url=$1

# Variables to be sent in the POST request
email="test@gmail.com"
subject="I will always be here for PLD"

# Use curl to send a POST request with variables and display the body
response=$(curl -s -X POST -d "email=$email&subject=$subject" "$url")

# Display the body of the response
echo "Response Body:"
echo "$response"
