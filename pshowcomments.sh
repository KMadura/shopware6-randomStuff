#!/bin/bash

# Author: Krzysztof Madura
# License: MIT

# Please put this file into shopware's default directory

pPluginDirectory="custom/plugins"

if [[ ! -d $pPluginDirectory ]]
then
	echo "Error! Could not find custom/plugins directory. Are you sure this script is placed in correct location?"
	exit
fi

pWriteInBold() {
	echo -e '\033[1m'$1'\033[0m'
}

# Browsing comments within code

pShowAllComments() {
	regexString='(?:(?:\#|\/\/|^\s*\*|\s*\/\*).*|\/\*.*?\*\/)'

	if [[ $(cat "$2" | grep -o -P "$regexString" | wc -l) -eq 0 ]]
	then
		return
	fi
	
	pWriteInBold "$1/$2"
	cat "$2" | grep -o -P "$regexString"
	echo ""
}

# Debug mode

if [[ $1 == "debug" ]]
then
	# Debug mode
	for phpFile in $((find . -type f -name "*.php" 2>/dev/null) | grep -v 'cache' | sed -e 's/^\.\///g')
	do
		pShowAllComments "" "$phpFile"
	done
	exit
fi

# Main logic

(
	cd $pPluginDirectory

	for pDirectory in *
	do
		if [[ ! -d "$pDirectory" ]]
		then
			continue
		fi
	
		(
			cd $pDirectory
			
			for phpFile in $((find . -type f -name "*.php" 2>/dev/null) | grep -v 'cache' | sed -e 's/^\.\///g')
			do
				pShowAllComments "$pDirectory" "$phpFile"
			done
		)
	done
)

#
# PHP file for testing (use base64 --decode to extract it)
#
# PD9waHAKCi8qIDEKKgoqLwoKLyogMgogKgogKi8KCi8qIDMgKi8KCiMjIyA0CgovLyA1Cg==
#
