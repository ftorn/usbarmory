#!/bin/sh

# REMEBER TO MODIFY THE VARs!!
##############################
GW="192.168.0.1"
USBARMORY="10.0.0.1"
##############################

case "$1" in
  start)
	echo "Add routing table..."
	echo "1 rt_usbarmory" >> /etc/iproute2/rt_tables
	ip rule add from $USBARMORY/32 table rt_usbarmory
	ip route add default via $GW table rt_usbarmory
	ip route del default
	ip route add default via $USBARMORY
	;;

  stop)
    echo "Remove routing table..."
	ip rule del from $USBARMORY/32 table rt_usbarmory
        ip route del default via $GW table rt_usbarmory
        ip route del default via $USBARMORY
        ip route add default via $GW
	;;

  *)
        echo "Usage: $0 {start|stop}"
        exit 1
esac
exit 0

