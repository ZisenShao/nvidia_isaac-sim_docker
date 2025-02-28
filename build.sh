#!/usr/bin/env bash
# build.sh - Build the Docker image for Isaac Sim 4.5.0

set -e  # Exit on any error

IMAGE_NAME="isaac-sim"
ISAAC_VERSION="4.5.0"

echo "Building Docker image ${IMAGE_NAME}:${ISAAC_VERSION} ..."
docker build -t "${IMAGE_NAME}:${ISAAC_VERSION}" . 
