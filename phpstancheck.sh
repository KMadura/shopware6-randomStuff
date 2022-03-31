#!/bin/bash

# Author: Krzysztof Madura
# License: MIT

if [[ -f "/.dockerenv" ]]
then
	echo "Don't run this script inside docker container"
	exit
	# You can edit this out if you have phpstan installed within docker container
fi

# Please change phpstan location to your own
pLocation="/home/yourOwnLocationWherePhpStanIsInstalled/phpstan/phpstan"

$pLocation analyse ./custom/plugins/VirtuaManager/src --level=8
