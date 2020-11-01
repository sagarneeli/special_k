#!/bin/bash

# Lets build the docker image which will contain all the dependencies and configurations to run 
# python training script (train.py) that trains and serializes the model
docker build --tag kensho_containerization_challenge .

# Clean the container name if it's been used previously
docker rm -f output

# Run the docker container which will produce the trained model tarball.
docker run --name output -it kensho_containerization_challenge --model-serialization-path="model.tar.gz"

# This creates a directory called model in the challenge_1 folder 
# which the output generated in our docker container
mkdir -p model

# Copy the required output file from the container to the host
docker cp output:/app/model.tar.gz ./model/
