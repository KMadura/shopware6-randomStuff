#!/bin/bash

# Running all three commands when you are debugging installation / uninstallation portion
# of a plugin can be boring. This just simplifies things. Just type "./pl"<tab>, hit enter
# and watch a plugin being reinstalled.
#
# Author: Krzysztof Madura
# License: MIT

if [[ ! -f "/.dockerenv" ]]
then
	echo "Please run this script inside docker container"
	exit
fi

if [[ -z "$1" ]]
then
	echo "Please supply an argument"
	exit
fi

./bin/console plugin:uninstall "$1"
./bin/console plugin:install "$1"
./bin/console plugin:activate "$1"

