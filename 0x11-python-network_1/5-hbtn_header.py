#!/usr/bin/python3

import requests
import sys

if len(sys.argv) != 2:
    print("Usage: python script.py <URL>")
    sys.exit(1)

url = sys.argv[1]

try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)

    x_request_id = response.headers.get('X-Request-Id')
    if x_request_id:
        print(x_request_id)
    else:
        print("X-Request-Id not found in the response header.")
except requests.exceptions.HTTPError as e:
    print(f"Error code: {e.response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
