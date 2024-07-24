#! /vendor/bin/sh

# send standard EJECT for some usb wifi dongles
usb_modeswitch -v 0x0e8d -p 0x2870 -K
usb_modeswitch -v 0x0bda -p 0x1a2b -K
