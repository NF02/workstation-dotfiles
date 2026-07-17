#!/bin/sh

ln -sf ~/.config/foot/themes/light.ini ~/.config/foot/themes/current.ini
pkill -USR1 foot
