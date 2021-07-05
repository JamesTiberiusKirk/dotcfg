#!/bin/sh

# These are my touchpad settings, found it easier to do it this way rather than with xorg.conf.d config files

# Use xinput list to get device id
DEVICE_ID=14

# This turns on natural scrolling
xinput set-prop $DEVICE_ID 311 0 1

# This sets the click type to two and three fingers rather than areas
xinput set-prop $DEVICE_ID 312 0 1
