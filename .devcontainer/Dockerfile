# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bookworm, bullseye, buster
#ARG VARIANT="bookworm-20250317"
FROM mcr.microsoft.com/devcontainers/base:debian-12

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Install X11 libraries to allow X11 forwarding with xhost +local
# RUN apt-get update && apt-get install -y x11-apps libx11-6 libgl1 libxext6 libxrender1 libxrandr2 libxfixes3 libxcursor1 libxinerama1 libxi6


# Install fontconfig
RUN apt-get update && apt-get install -y fontconfig && rm -rf /var/lib/apt/lists/*
