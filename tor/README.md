TOR for usbarmory
====================

## Installation

-FROM USBARMORY
-Compile your image
 `cd /yourpath/tor`
-Edit your .profile and append (set your timezone)
 TZ='Europe/Rome'; export TZ
-Remeber that the usbarmory and the TOR container HAVE to be in sync so:
 `sudo ntpdate -b ntp2.ien.it`

-FROM YOUR HOST (ex:laptop ecc...)
-Use `host.sh` to modify the routing table and enable the NAT rules for your usbarmory (you have to modify the script and adapt the VARs to your needed)

-FROM USBARMORY
-Use `start-tor.sh` to start TOR container
-The TOR container start correctly only if in the output you see these logs:
 ---
 [notice] Tor has successfully opened a circuit. Looks like client functionality is working.
 [notice] Bootstrapped 100%: Done
 ---
-Use `usbarmory-fw.sh start` to create the iptables rules (you have to modify the script and adapt the VARs to your needed):
-Try it:
	FROM HOST:
	-open your browser and got to https://check.torproject.org
	FROM USBARMORY
	-curl https://check.torproject.org
-Use `tor.sh stop` to:
	-stop TOR container
	-remove iptables rules

## References
-https://blog.jessfraz.com/post/routing-traffic-through-tor-docker-container/
-https://trac.torproject.org/projects/tor/wiki/doc/TransparentProxy
-https://github.com/inversepath/usbarmory/wiki/Applications
