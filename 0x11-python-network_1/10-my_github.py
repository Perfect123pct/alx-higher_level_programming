#!/usr/bin/python3

import requests
import sys

if len(sys.argv) != 3:
    print("Usage: python script.py <username> <personal_access_token>")
    sys.exit(1)

username = sys.argv[1]
personal_access_token = sys.argv[2]

url = "https://api.github.com/user"

try:
    response = requests.get(url, auth=(username, personal_access_token))
    response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)

    user_data = response.json()
    print("Your GitHub user id is:", user_data['id'])
except requests.exceptions.HTTPError as e:
    print(f"Error code: {e.response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
