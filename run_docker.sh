#!/usr/bin/env bash

# Builds image and add a descriptive tag
docker build -t joeygeofrey/ml-api .

# Lists docker images
docker image ls

# Runs flask app
docker run -p 8000:80 ml-api