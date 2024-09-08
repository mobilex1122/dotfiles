#!/usr/bin/env bash
#killall -e xdg-desktop-portal-hyprland
#killall -e xdg-desktop-portal

#systemctl restart --user pipewire.service
#sleep 1
#systemctl restart --user pipewire-pulse
#sleep 1
#/usr/lib/xdg-desktop-portal-hyprland &!
#sleep 2
#/usr/lib/xdg-desktop-portal &!


sleep 1
notify-send "Restarting Hyprland XDG"
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
notify-send "Starting XDG Portal"
