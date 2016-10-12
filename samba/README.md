Samba for usbarmory
====================

## Installation

FROM USBARMORY
- Edit file "Dockerfile" and change USERNAME and PASS:
  - `ENV USERNAME="usbarmory" PASS="usbarmory"`
- Create dir `/data`:
  - `mkdir /data`
- Compile your image
  - `cd /yourpath/electrum`
  - `sudo docker build -t samba .`
- Use it:
  - `sudo docker run --rm -it --network=host -v /home/usbarmory/data:/shared --name samba samba`
