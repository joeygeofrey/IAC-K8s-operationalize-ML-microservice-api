# UdaPredict | Operationalize a Machine Learning Microservice API - Joey Geofrey

## Build Status:
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/joeygeofrey/IAC-K8s-operationalize-ML-microservice-api/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/joeygeofrey/IAC-K8s-operationalize-ML-microservice-api/tree/main)

## Project Scope

Operationalize a Machine Learning Microservice API, using a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios etc. 

Read more about the data, initially taken from [Kaggle, the data source](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

The goal of this project is to operationalize a working, machine learning microservice using [K8s](https://kubernetes.io/), an open-source system for automating the management of containerized applications. Following are the tasks for this project:
* Test and lint the project code using hadolint and pylint
* Complete a Dockerfile to containerize this application
* Deploy the containerized application using Docker and make a prediction
* Improve log statements in the source code for this application
* Configure K8s and create a K8s cluster
* Deploy a container using K8s and make a prediction
* Upload a complete Github repo with CircleCI to indicate that the code has been tested

### Project Repo Files Overview

.circleci `CircleCI directory for the configuration files`\
config.yml `YAML configuration file with parameters and workflows for building/testing`\
model_data `Contains the model data for the Flask app`\
output_txt_files `A directory containing output logs from Docker and K8s`\
docker_out.txt `Log statements containing output prediction values`\
k8s_out.txt `Log statements containing output prediction values`\
Dockerfile `Builds Docker images based on the instructions within`\
Makefile `Contains a set of utility commands to build and manage the project`\
README.md `Summary of the project and execution`\
app.py `Flask app which converts a JSON payload to a DataFrame, passes data to the pre-trained model`\
make_predictions.sh `Sends input data to the flask app`\
requirements.txt `Lists required dependencies and package versions`\
run_docker.sh `Shell script which builds a Docker image and runs the container`\
run_k8s.sh `Shell script that downloads Docker image, deploys the pod, and forwards the port`\
upload_docker.sh `Shell script that pushes the built Docker image to DockerHub`

---

## Setup the Project Environment
Navigate `cd` into the project repo directory

### Python Virtual Environment
* Create a virtual environment and activate it
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
python3 -m venv ~/.ml-api
source ~/.ml-api/bin/activate
```
* Run `make install` to install all necessary dependencies
* Run `make lint` to lint your source code

### Steps for Docker Deployment

1. Verify Dockerfile  `cat Dockerfile`
2. Build docker image + run container (Flask app) locally `./run_docker.sh`
3. Run predictions: open a new terminal tab and call `./make_prediction.sh`
3. Exit the Flask app `ctrl + C`

### Steps for K8s Deployment

1. Start a local cluster `minikube start`
2. Verify cluster configurations `kubectl config view`  - look for `certificate authority` and `server`
3. Download Docker image, deploy to pod and forward the port `./run_K8s.sh`
4. Run predictions: open a new terminal tab and call `./make_prediction.sh`
5. Exit the Flask app `ctrl + C`
6. Pause the clyster `minikube stop` or delete the cluster `minikube delete`