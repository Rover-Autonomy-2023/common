# common
Dockerfiles and scripts to streamline development 

## Quickstart

Set up your Raspberry Pi (64-bit OS) development environment by following the instructions [here](https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up/4).

Install Docker on your Raspberry Pi using the [convenience script](https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script) and follow the [post-installation instructions](https://docs.docker.com/engine/install/linux-postinstall/)


Clone this repository and its dependencies under `~/rover23-24/`.

```bash
mkdir -p ~/rover23-34 && cd ~/rover23-34
git clone https://github.com/Rover-Autonomy-2023/common.git
```

If you are on a memory-limited platform such as the <8GB, increasing the swap size to 6GB is recommended as it will be required to build ROS packages from source. You can do that by following the instructions [here](https://diyusthad.com/2022/01/how-to-increase-swap-size-in-raspberry-pi.html). 

Build the image using our convenience script

```bash
cd common/docker
bash docker_build_rover_base.sh
```

Run the container 

```bash
sudo bash docker_run_rover_base.sh
```

If you are doing this for the first time, the Intel Realsense camera will have to be unplugged and replugged for the udev rule to take effect. This allows passing the camera to the container in a repeatable manner.
