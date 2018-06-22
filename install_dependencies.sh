#!/bin/sh
# Update the repositories
apk update

# Install dependencies
apk add --no-cache --virtual build-dependencies gcc python3-dev musl-dev
apk add postgresql-dev make

# Install Python requirements
pip3 install --no-cache-dir -r requirements.txt

# Remove the temporary dependencies
apk del build-dependencies
