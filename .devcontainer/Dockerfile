# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bookworm, bullseye, buster
#ARG VARIANT="bookworm-20250317"
FROM mcr.microsoft.com/devcontainers/base:debian-12

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Install X11 libraries to allow X11 forwarding with xhost +local
# RUN apt-get update && apt-get install -y x11-apps libx11-6 libgl1 libxext6 libxrender1 libxrandr2 libxfixes3 libxcursor1 libxinerama1 libxi6

ENV DATA_GIT_PROJECTS_DIR="/home/manuel/mgallegoa"

# Install bash, sudo, fontconfig and other
# 1. fontconfig: To configure font colors in bash.
# 2. automake autoconf libtool pkg-config: To build programs.
# 3. build-essential libevent-dev libncurses-dev: To build Tmux.
RUN apt-get update \
  && apt-get install -y ripgrep fontconfig automake autoconf libtool pkg-config build-essential libevent-dev libncurses-dev bison bash-completion command-not-found locales tzdata fd-find jq \
  && rm -rf /var/lib/apt/lists/*

# Configure the time zone
ENV TZ=America/Bogota
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# Create user 'manuel' with home directory
RUN useradd -ms /bin/bash manuel \
  && usermod -aG sudo manuel \
  && echo "manuel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy setup into the container
COPY setup.sh /home/manuel/setup.sh

# Make sure the setup is owned by 'manuel' and executable
RUN chown manuel:manuel /home/manuel/setup.sh && \
    chmod +x /home/manuel/setup.sh

# Switch to user 'manuel'
USER manuel

RUN mkdir -p /home/manuel/setup-tools
COPY setup-tools /home/manuel/setup-tools

# Run the setup
RUN /home/manuel/setup.sh
