#!/usr/bin/env bash
# run.sh - Run the Isaac Sim 4.5.0 container with GUI support using X11

# Allow container to access the host X server for GUI (this may prompt for your host password)
xhost +local:root > /dev/null 2>&1

# Run the Docker container interactively with GPU access and appropriate mounts for GUI support
docker run -it --rm \
    --gpus all \
    --network=host \
    --name isaac-sim \
    -e DISPLAY=$DISPLAY \
    -e "ACCEPT_EULA=Y" \
    -e "PRIVACY_CONSENT=Y" \
    -v ~/docker/isaac-sim/cache/kit:/isaac-sim/kit/cache/Kit:rw \
    -v ~/docker/isaac-sim/cache/ov:/root/.cache/ov:rw \
    -v ~/docker/isaac-sim/cache/pip:/root/.cache/pip:rw \
    -v ~/docker/isaac-sim/cache/glcache:/root/.cache/nvidia/GLCache:rw \
    -v ~/docker/isaac-sim/cache/computecache:/root/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim/logs:/root/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim/data:/root/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim/documents:/root/Documents:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/dri:/dev/dri \
    isaac-sim:4.5.0

# Note: You will now be inside the container's bash shell.
# To launch Isaac Sim with its GUI, execute the appropriate launch script (e.g., ./runapp.sh) from within the container.
