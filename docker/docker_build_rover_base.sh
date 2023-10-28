#!/bin/bash

CONTAINER_IMAGE=rover-base:1.0

# From the docker dir
docker build -t $CONTAINER_IMAGE -f Dockerfile.rover_base .
