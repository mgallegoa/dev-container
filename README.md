# dev-container

               ███╗░░░███╗░█████╗░███╗░░██╗██╗░░░██╗███████╗██╗░░░░░
               ████╗░████║██╔══██╗████╗░██║██║░░░██║██╔════╝██║░░░░░
               ██╔████╔██║███████║██╔██╗██║██║░░░██║█████╗░░██║░░░░░
               ██║╚██╔╝██║██╔══██║██║╚████║██║░░░██║██╔══╝░░██║░░░░░
               ██║░╚═╝░██║██║░░██║██║░╚███║╚██████╔╝███████╗███████╗
               ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝

My personal and custom dev-container, using https://github.com/devcontainers/ specification.

Based on: 
docker pull debian:bookworm-20250317 (117MB)

> The image *docker pull debian:stable-slim* have 27MB but executing the *apt-get update* it is 94.4MB. So + 368MB for the needed tools, total size of the image 463MB.
>
> The image *docker pull debian:bookworm-20250317* executing the *apt-get update* it is 136MB

## Run/build the container

Build the image:
> devcontainer build --image-name manuelarias/devcontainer:v1 --workspace-folder /media/manuel/Datos/mgallegoa/dev-container/

Run the image:
> docker run -d --name manuelarias-devcontainer-debian manuelarias/devcontainer:v1

Build and run the image (not custom name for the image):
> devcontainer up --workspace-folder /media/manuel/Datos/mgallegoa/dev-container/

This will create the next directory and place the root files and folders:
/workspaces/dev-container/

Use the next command to connect to the new devcontainer:
> docker exec -it container_id bash

## Tools
1. NeoVim
2. Tmux
3. Node Version Manager NVM (node and typescript)
4. SDKMan

### Core Packages Included in debian:slim
 | Package	    | Description	                        |   Purpose                                         |
 | -----------  | -------------------------------       | --------------------------------                  |
 | base-files   |	Basic Debian filesystem layout      |	Provides system directories (/etc, /var, etc.)  |
 | base-passwd  |	User and group definitions          |	Manages system users (root, nobody, etc.)|
 | bash         |	GNU Bourne Again Shell              |	Default shell (/bin/bash)|
 | dash         |	Debian Almquist Shell               |	Lightweight /bin/sh shell|
 | coreutils    |	Core UNIX utilities                 |	ls, cp, mv, rm, cat, etc.|
 | libc6        |	GNU C Library (glibc)               |	Essential runtime library for most programs|
 | libstdc++6   |	Standard C++ Library                |	Required for C++ applications|
 | zlib1g       |	Compression library                 |	Used by gzip, tar, and other tools|
 | debconf      |	Debian package configuration tool   |	Manages package installation settings|
 | dpkg         |	Debian package manager              |	Backend for apt (but no apt-utils)|
 | grep         |	Pattern search tool                 |	Used for text searching (grep "word" file.txt)|
 | gzip         |	File compression utility            |	Used for .gz file compression|
 | tar          |	Archive utility                     |	Used for .tar.gz and .tar files|
 | hostname     |	Sets system hostname                |	hostname command available|
 | init-system-helpers  |	Basic init system utilities |	Provides /sbin/init|
 | ncurses-base |	Terminal interface library          |	Enables interactive terminal UIs|
 | sed          |	Stream editor for text processing   |	Used in scripting (sed 's/foo/bar/g' file)|
 | util-linux   |	System utilities                    |	Provides blkid, fdisk, mount, etc.|
 | libapt-pkg6.0|	APT package manager library         |	Enables apt-get functionality|
 | libgcc1      |	GCC runtime library                 |   Needed for compiled programs|


### Debian Packages Excluded in debian:slim but included in debian image:

 | Tool            |	Description                             |	Usage                               |	Alternative / How to Install|
 | -----------     |    -----------------------------           |   -----------------------------       |   --------------------|
 | man             |	Manual pages for commands               |	man ls to view documentation        |	apt-get install man-db|
 | info            |	GNU info pages for commands             |	info grep to read GNU manuals       |	apt-get install texinfo|
 | bash-completion |	Auto-completion for Bash shell          |	Tab-completion for commands         |	apt-get install bash-completion|
 | locales         |	Language and regional settings          |	Setting system language (LANG=...)  |	apt-get install locales|
 | dpkg-dev        |	Debian package development tools        |	Creating .deb packages              |	apt-get install dpkg-dev|
 | build-essential |	Compilation tools (gcc, make)           |	Compiling software from source      |	apt-get install build-essential|
 | apt-utils       |	Enhances apt-get output                 |	Shows progress/details in apt-get   |	apt-get install apt-utils|
 | perl            |	Perl programming language               |	Running Perl scripts                |	apt-get install perl|
 | ping (iputils-ping) |	Checks network connectivity         |	ping google.com                     |	apt-get install iputils-ping|
 | wget            |	Downloads files from the web            |	wget example.com/file.zip           |	apt-get install wget|
 | curl            |	Transfers data from URLs                |	curl -O example.com/file.zip        |	apt-get install curl|
 | nano            |	Simple text editor                      |	nano file.txt                       |	apt-get install nano|
 | vim-tiny        |	Minimal version of Vim                  |	vim file.txt                        |	apt-get install vim|
 | ps (procps package)|	Lists running processes                 |	ps aux                              |	apt-get install procps|
 | top/htop        |	Monitors system processes               |	top to see CPU/memory usage         |	apt-get install htop|
 | net-tools       |	Networking utilities (ifconfig, netstat)|	ifconfig to check IP address        |	apt-get install net-tools|
 | traceroute      |	Traces network routes                   |	traceroute google.com               |	apt-get install traceroute|
 | iptables        |	Linux firewall control                  |	iptables -L to list rules           |	apt-get install iptables|
 | rsyslog         |	System log manager                      |	Logs system events                  |	apt-get install rsyslog|
 | cron            |	Task scheduler                          |	Runs scheduled tasks (crontab -e)   |	apt-get install cron|
 | systemd/systemctl|	System and service manager              |	systemctl restart service           |	Not used in Docker, but can install systemd|
 | tzdata          |	Timezone database                       |	Setting timezone (dpkg-reconfigure tzdata)|	apt-get install tzdata|
 | adduser/useradd |	User account management                 |	adduser username                    |	apt-get install passwd|
 | less            |	Pager for viewing files                 |	less file.txt                       |	apt-get install less|
 | ip (iproute2)   |	Network configuration tool              |	ip addr show                        |	apt-get install iproute2|
