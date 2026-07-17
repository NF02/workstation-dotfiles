#!/bin/sh

ln -sf ~/.config/foot/themes/dark.ini ~/.config/foot/themes/current.ini
pkill -USR1 foot
