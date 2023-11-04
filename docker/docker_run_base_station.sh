#!/bin/bash

ROVER_DIR="/home/$(logname)/rover23-24"

CONTAINER_IMAGE=base-station:1.0
# Give docker root user X11 permissions
sudo xhost +si:localuser:root

# Enable SSH X11 forwarding inside container (https://stackoverflow.com/q/48235040)
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod 777 $XAUTH

docker run --privileged -it --network host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH \
    --device=/dev/realsense_camera \
    -v $ROVER_DIR:/root/rover23-24 \
    $USER_VOLUME $CONTAINER_IMAGE $USER_COMMAND 

