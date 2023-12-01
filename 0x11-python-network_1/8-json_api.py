#!/usr/bin/python3

import requests
import sys

if len(sys.argv) == 2:
    letter = sys.argv[1]
else:
    letter = ""

url = "http://0.0.0.0:5000/search_user"
data = {'q': letter}

try:
    response = requests.post(url, data=data)
    response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)

    try:
        json_data = response.json()
        if json_data:
            print("[{}] {}".format(json_data['id'], json_data['name']))
        else:
            print("No result")
    except ValueError:
        print("Not a valid JSON")
except requests.exceptions.HTTPError as e:
    print(f"Error code: {e.response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
