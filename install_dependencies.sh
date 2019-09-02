#!/bin/sh
set -ex

# Update apk packages list  
apk update

# Install dependencies
apk add --no-cache --virtual build-dependencies \
    gcc \
    python3-dev \
    musl-dev \
    make
# Install and keep psycopg2 dependency
apk add postgresql-dev

# Install Python requirements
pip3 install --upgrade pip
pip3 install --no-cache-dir -r requirements.txt

# Remove the temporary dependencies
apk del build-dependencies
