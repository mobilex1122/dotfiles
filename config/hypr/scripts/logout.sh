#!/bin/sh
kdialog --warningyesno "Log out?" && hyprctl dispatch exit
