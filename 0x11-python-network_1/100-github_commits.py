#!/usr/bin/python3

import requests
import sys

if len(sys.argv) != 3:
    print("Usage: python script.py <repository_name> <owner_name>")
    sys.exit(1)

repository_name = sys.argv[1]
owner_name = sys.argv[2]
api_url = f"https://api.github.com/repos/{owner_name}/{repository_name}/commits"

try:
    response = requests.get(api_url)
    response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)

    commits = response.json()[:10]  # Get the 10 most recent commits

    for commit in commits:
        sha = commit['sha']
        author_name = commit['commit']['author']['name']
        print(f"{sha}: {author_name}")
except requests.exceptions.HTTPError as e:
    print(f"Error code: {e.response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
