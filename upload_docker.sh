#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Create dockerpath
dockerpath=joeygeofrey/ml-api

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag ml-api $dockerpath

# Push the image to a docker repository
docker push $dockerpath