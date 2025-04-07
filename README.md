# dev-container

               ███╗░░░███╗░█████╗░███╗░░██╗██╗░░░██╗███████╗██╗░░░░░
               ████╗░████║██╔══██╗████╗░██║██║░░░██║██╔════╝██║░░░░░
               ██╔████╔██║███████║██╔██╗██║██║░░░██║█████╗░░██║░░░░░
               ██║╚██╔╝██║██╔══██║██║╚████║██║░░░██║██╔══╝░░██║░░░░░
               ██║░╚═╝░██║██║░░██║██║░╚███║╚██████╔╝███████╗███████╗
               ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝

My personal and custom dev-container, using https://github.com/devcontainers/ specification.

> [!TIP]
> When finished the generation of the container, there is a log file in the /home/manuel/setup.log

Based on: 
docker pull debian:bookworm-20250317 (117MB)

> [!NOTE]
> The image *docker pull debian:stable-slim* have 27MB but executing the *apt-get update* it is 94.4MB. So + 368MB for the needed tools, total size of the image 463MB.
>
> The image *docker pull debian:bookworm-20250317* executing the *apt-get update* it is 136MB

## Run/build the container

Build the image:
> devcontainer build --image-name manuelarias/devcontainer:v1 --workspace-folder /media/manuel/Datos/mgallegoa/dev-container/

Run the image:
> docker run -d -v /media/manuel/Datos/mgallegoa/dev-container/:/workspace/dev-container/ --name manuelarias-devcontainer-debian manuelarias/devcontainer:v1

Build and run the image (not custom name for the image):
> devcontainer up --build-no-cache --workspace-folder /media/manuel/Datos/mgallegoa/dev-container/

This will create the next directory and place the root files and folders:
/workspaces/dev-container/

Use the next command to connect to the new devcontainer:
> [!IMPORTANT]
> docker exec -it --user manuel container_id bash

## Tools
1. .bashrc, Nerd Fonts and icons, Oh My Posh
1. Tmux
2. NeoVim
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
