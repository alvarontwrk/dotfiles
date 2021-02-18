#!/bin/sh

enable-touchpad
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1&
exec dbus-launch i3 # Starts i3
