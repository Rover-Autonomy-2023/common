#!/bin/bash

# Define ROS domain id here
ROS_DOMAIN_ID=8

# Install dependencies
source /opt/ros/humble/setup.bash  # use setup.zsh if using zsh

export ROS_DOMAIN_ID=$ROS_DOMAIN_ID

# To keep container running
exec bash
