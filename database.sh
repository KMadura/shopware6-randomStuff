#!/bin/bash

# If you are a linux user and prefer native mysql-cli application, here is
# the simpliest way to open mysql console and access shopware's database located
# in a docker container
#
# Before you run this command check first what is your database user name
# password and database name. If you want to pass password automatically without
# typing it in, write it after the -p option without spacebar. Alternatively
# you can use --password="{password}".
#
# Port 4406 is delivered by shopware's docker configuration. Please check if it
# is the same on your side. For me I had to switch protocol to tcp, because
# udp was not provided outside container.
#
# To pass an ID which is saved by shopware as binary string (UUID), keep
# --binary-as-hex option. In cli you can then use such statement:
# SELECT * FROM product WHERE id=X'b2301a0718210a2a9c67e1fb388016ea'.
# Remember to put X after equation symbol.
#
# Last. If you want to scroll results both vertically and horizontally,
# without table breaking into pieces, "less -SFX" is probably the best option.
#
# Author: Krzysztof Madura
# License: MIT

mysql -u app -papp shopware --pager="less -SFX" -h localhost --port=4406 --protocol=tcp --binary-as-hex
