#!/bin/bash

# Sometimes shopware likes to hang for a weird reason and f5 doesn't help
# there are occassional problems wich happen exremely rarely, however
# during development you may be stuck in a place where a single piece
# of code which should not cause any problems hangs this platform and
# produces memleak or infinite loop.
#
# This has happened to me once when I forgot to set autoload flag to false
# on one of one to one definitions making shopware autoload objects
# infinitely. What is even more confusing, someitmes shopware did
# load a page when two autoload flags were set to true.
#
# You probably may have encountered a situation where a process on linux
# machine eats all the ram to the point when an operating system can't
# allocate more memory and hangs. Setting swap partition only declines
# this problem, therefore you need to shut down problematic processes
# before you run out of memory.
#
# This is just plain basic script which kills all the php-fpm processes
# inside docker container freeing the memory.
#
# Author: Krzysztof Madura
# License: MIT

if [[ ! -f "/.dockerenv" ]]
then
	echo "Please run this script only inside docker container"
	exit
fi

for i in $(pidof php-fpm)
do
	# if something cannot be killed
	# suppress it's error message
	kill -9 "$i" &>/dev/null
done
