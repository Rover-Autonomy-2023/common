#!/bin/bash

CONTAINER_IMAGE=base-station:1.0

# From the docker dir
docker build -t $CONTAINER_IMAGE -f Dockerfile.base_station .
