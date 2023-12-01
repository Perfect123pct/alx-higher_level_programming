#!/usr/bin/python3

import requests
import sys

if len(sys.argv) != 3:
    print("Usage: python script.py <URL> <email>")
    sys.exit(1)

url = sys.argv[1]
email = sys.argv[2]

data = {'email': email}

try:
    response = requests.post(url, data=data)
    response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)

    body = response.text
    print(body)
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
