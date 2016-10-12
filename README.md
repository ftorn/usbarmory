Docker for usbarmory
====================

## Intro

- You find three dirs:
        - docker, the files needed to install 'docker'
        - tor, Dockerfile related to the application 'Tor Anonymizing Middlebox' - https://github.com/inversepath/usbarmory/wiki/Applications
        - electrum, Dockerfile related to the application 'Bitcoin Wallet' - 'https://github.com/inversepath/usbarmory/wiki/Applications'

## Installation

- You can install docker 1.12.1 in two steps:
- First, recompile the usbarmory kernel (overlayFS support)
	- Easy way: I've recompiled the kernel to support docker and you find the files in the git repository
	- Hard way: You have to recompile the kernel to support docker
- Second, install docker 1.12.1

## First: The 'Easy way'
- You find two files in the github:
	- 'uImage'
	- '4.7.2.tar.gz'
- FROM YOUR USBARMORY
  You have to move the new 'uImage' in the '/boot/' directory (it's a good idea to make a copy of the original file):
  `sudo mv /boot/uImage /boot/uImage.orig`
  `sudo mv /path_git_clone/uImage /boot/uImage`
  `sudo chown -R root.root /boot/uImage`
  You have to decompress '4.7.2.tar.gz' in the '/lib/modules/' directory (it's a good idea to make a copy of the original dir):
  `sudo mv /lib/modules/4.7.2 /lib/modules/4.7.2.orig`
  `sudo tar -zxvf /path_git_clone/4.7.2.tar.gz -C /lib/modules/`
  `sudo chown -R root.root /lib/modules/4.7.2`
- Reboot usbarmory

## Second: The 'Hard way'
- NOT FROM YOUR USBARMORY BUT FROM YOUR SYSTEM OR VM
- I suggest to use a VM (I've tried to cross compile with a docker container but without results -sometimes the concept of kernel sharing is a pain in the butt ehehe))
- I suggest to use the file '.config' that you find in the git repository
- You can follow the istructions that you find at uri 'https://github.com/inversepath/usbarmory/wiki/Preparing-a-bootable-microSD-image'. You have to follow ONLY the sections:
	- Prerequisites
	- Toolchain
	- Kernel: Linux 4.7.2 (use the .config of the git repo)

## Install docker
- FROM YOUR USBARMORY
- Add overlay module:
  `echo "overlay" | sudo tee -a /etc/modules`
- Download docker_engine:
  `wget https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.12.1-0~jessie_armhf.deb`
- Install .deb (it'll give you an error...don't worry you have to modify the systemd file):
  `sudo dpkg -i docker-engine_1.12.1-0~jessie_armhf.deb`
- Modify file '/lib/systemd/system/docker.service' in this way (you have to use sudo):
  `ExecStart=/usr/bin/dockerd -H unix:// -s overlay`  
- Reload systemd:
  `sudo systemctl daemon-reload`
- Try docker:
  `sudo docker --version`
