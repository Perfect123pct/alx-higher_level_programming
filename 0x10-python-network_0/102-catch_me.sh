#!/bin/bash

# Make a request to the specified URL with curl
curl -sLX PUT 0.0.0.0:5000/catch_me -d "user_id=98" -H "Origin: HolbertonSchool"
