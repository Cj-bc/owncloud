#!/bin/bash
#
# installer for owncloud
#
# copyright (c) 2018 Cj.bc_sd
#


# This is installer for owncloud, which is owncloud tool.
# I highly recommend to use Homebrew or linuxbrew if you can

if ! [ -e /usr/bin/owncloud ]
then
  mv owncloud.sh /usr/bin/owncloud
