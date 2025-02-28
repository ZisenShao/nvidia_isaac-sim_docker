# Dockerfile - Isaac Sim 4.5.0 (Ubuntu 22.04) with GUI, no ROS2
FROM nvcr.io/nvidia/isaac-sim:4.5.0

# Set proxy environment variables and other necessary settings
ENV NO_PROXY="localhost.127.0.0.1,::1"
ENV HTTP_PROXY="ftp://squid.cs.wisc.edu:3128/"
ENV HTTPS_PROXY="http://squid.cs.wisc.edu:3128/"
ENV HTTP_PROXY="http://squid.cs.wisc.edu:3128/"
ENV no_proxy="localhost.127.0.0.1,::1"
ENV ftp_proxy="ftp://squid.cs.wisc.edu:3128/"
ENV https_proxy="http://squid.cs.wisc.edu:3128/"
ENV http_proxy="http://squid.cs.wisc.edu:3128/"
ENV NVIDIA_DRIVER_CAPABILITIES="all"
ENV OMNI_KIT_ALLOW_ROOT=1

# Install essential dependencies for Isaac Sim GUI on Ubuntu 22.04
RUN apt-get update && apt-get -oDebug::pkgAcquire::Worker=1 install -y --no-install-recommends \
    libatomic1 libegl1 libglu1-mesa libgomp1 \
    libsm6 libxi6 libxrandr2 libxt6 \
    libfreetype6 libfontconfig1 openssl vulkan-tools zenity nano vim \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# (GUI mode is enabled by default; no headless mode flags are set)

# Set entrypoint to bash for an interactive container session
ENTRYPOINT ["/bin/bash"]
