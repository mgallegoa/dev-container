# dev-container

               ███╗░░░███╗░█████╗░███╗░░██╗██╗░░░██╗███████╗██╗░░░░░
               ████╗░████║██╔══██╗████╗░██║██║░░░██║██╔════╝██║░░░░░
               ██╔████╔██║███████║██╔██╗██║██║░░░██║█████╗░░██║░░░░░
               ██║╚██╔╝██║██╔══██║██║╚████║██║░░░██║██╔══╝░░██║░░░░░
               ██║░╚═╝░██║██║░░██║██║░╚███║╚██████╔╝███████╗███████╗
               ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝

My personal and custom dev-container:

    1. Using https://github.com/devcontainers/ specification. The specification use the folder .devcontainer to build and run.

    2. Using a Docker file to build the image.

> [!TIP]
> When finished the generation of the container, there is a log file in the /home/manuel/setup.log

Based on: 
docker pull debian:bookworm-20250317 (117MB)

> [!NOTE]
> The image *docker pull debian:stable-slim* have 27MB but executing the *apt-get update* it is 94.4MB. So + 368MB for the needed tools, total size of the image 463MB.
>
> The image *docker pull debian:bookworm-20250317* executing the *apt-get update* it is 136MB

## Tools
1. .bashrc, Nerd Fonts and icons, Oh My Posh
2. Tmux
3. Node Version Manager NVM (node and typescript)
4. SDKMan
5. NeoVim (Require npm)

## Build/Run the container devContainer specification, using devContainer CLI

npm i -g @devcontainers/cli

Build the image:
> devcontainer build --image-name manuelarias/devcontainer:v1 --workspace-folder /media/manuel/Datos/mgallegoa/dev-container/

Run the image (Example in my personal laptop):
> docker run -it -d -v /media/manuel/Datos/mgallegoa/:/home/manuel/mgallegoa/ -p 8080:4000 -p 8081:3000 --name manuel-dev-container-spec manuelarias/dev-container-spec:v1 bash -c ' while sleep 1 & wait $!; do :; done'

Build and run the image (not custom name for the image):
> devcontainer up --build-no-cache --workspace-folder /media/manuel/Datos/mgallegoa/dev-container/

This will create the next directory and place the root files and folders:
/workspaces/dev-container/

Connect to the running container:
> docker exec -it --user manuel manuel-dev-container-spec bash

> [!NOTE]
> This container is hosted in DockerHub: https://hub.docker.com/r/manuelarias/dev-container-spec


## Build/Run the container only from Dockerfile (NOT use the devContainer specification)

Use the .devcontainer-manuel/Dockerfile to build the image.
Build the image:
> docker build --no-cache -t manuelarias/dev-container:v2 -f .devcontainer-manuel/Dockerfile .

Run the image (Example in my personal laptop):
> docker run -it -d -v /media/manuel/Datos/mgallegoa/:/home/manuel/mgallegoa/ -p 8080:4000 -p 8081:3000 --name manuel-dev-container manuelarias/dev-container:v2 bash -c ' while sleep 1 & wait $!; do :; done '

Run the image (Example in Play With Docker PWD):
> docker run -it -d -v /home/manuel/mgallegoa/:/home/manuel/mgallegoa/ -p 8080:4000 -p 8081:3000 --name manuel-dev-container manuelarias/dev-container:v2 bash -c '  while sleep 1 & wait $!; do :; done '

Connect to the running container:
> docker exec -it --user manuel manuel-dev-container bash


> [!IMPORTANT]
> Afther installation, for Java, install the java version (using SDKMan), example:
>    sdk install java 21.0.6-tem

> [!NOTE]
> This container is hosted in DockerHub: https://hub.docker.com/r/manuelarias/dev-container


### Lazy NeoVim - Mason Plugins:

 1. LSP: Run Mason and install (i) the Language Servers LSP:
    1.1. lua_ls: lua-language-server
    1.2. cssls : vscode-css-languageservice
    1.3. html : vscode-html-languageservice
    1.4. ts_ls : typescript-language-server
    1.5. jdtls : eclipse.jdt.ls

 2. DAP
    2.1. bash : bash
    2.1. js : vscode-js-debug (js-debug-adapter)
    2.1. java-debug-adapter : java-debug-adapter
    2.1. java-test : For support for JUnit/TestNG test debugging

 3. Linter
    2.1. eslint_d : eslint_d.js (Linter and Formater)
    2.2. htmlhint : htmlhint.com

 4. Formater:
    2.1. prettierd: prettierd
    2.2. stylua : StyLua


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


### Common Linux Folders Explained
 | Folder   |	Description                             |	Common Uses|
 | -------- | -----------------------------------       |   ------------------------    |
 | /        |	Root of the filesystem                  |	Everything starts here|
 | /bin     |	Essential user binaries (commands)      |	Commands like ls, cp, mv, used in single-user mode|
 | /sbin    |	System binaries (mostly for root/admin) |	Tools like fsck, reboot, etc.|
 | /usr     |	User-installed software and data        |	Subfolders like /usr/bin, /usr/lib, /usr/share contain main OS apps|
 | /usr/local   |	Locally installed software          |	User-compiled packages outside system package manager|
 | /opt     |	Optional software packages              |	3rd-party apps (e.g., VSCode, Chrome); versioned software directories|
 | /etc     |	Configuration files                     |	System-wide config: /etc/passwd, /etc/hosts, /etc/network|
 | /home    |	User home directories                   |	Personal files, shell config, downloads, etc. (/home/username)|
 | /root    |	Root user’s home directory              |	Only accessible to root|
 | /var     |	Variable files (data that changes)      |	Logs (/var/log), mail, spool, caches, etc.|
 | /tmp     |	Temporary files (cleared at reboot)     |	Scratch space for apps or users|
 | /dev     |	Device files                            |	Access to hardware like /dev/sda, /dev/null|
 | /proc    |	Kernel and process info (virtual filesystem)|	Process stats, CPU/mem info, used by top, ps, etc.|
 | /sys     |	System configuration info from kernel (virtual FS)|	Hardware details, tunables|
 | /lib     |	Essential shared libraries              |	Needed for binaries in /bin and /sbin|
 | /media   |	Mount points for removable media        |	USB drives, CDs auto-mounted here|
 | /mnt     |	Temporary mount point for manual use    |	Admins manually mount disks like /mnt/disk1|
 | /boot    |	Boot loader files                       |	Kernel images, GRUB config|
 | /run     |	Runtime data for processes              |	PID files, sockets, system state during boot|
 | /srv	    |   Service data                            |	Web, FTP, or other server-specific directories|


### ✅ Most Common User-Accessible Ones:
/home — your stuff

/etc — system configs

/opt — manually installed apps

/usr/local — compiled software

/var/log — logs

/tmp - temporal files
