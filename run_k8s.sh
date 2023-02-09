#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Your Docker ID/path
dockerpath=joeygeofrey/ml-api

# Run the Docker Hub container with K8s
kubectl run ml-api --image=$dockerpath --port=80

# List K8s pods
kubectl get deploy,rs,svc,pods
sleep 20

# Forward the container port to a host
kubectl port-forward ml-api 8000:80

