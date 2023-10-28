#!/bin/bash

CONTAINER_IMAGE=rover-base:1.0
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
    -v /home/rover23-24:/root/rover23-24 \
    $USER_VOLUME $CONTAINER_IMAGE $USER_COMMAND 

