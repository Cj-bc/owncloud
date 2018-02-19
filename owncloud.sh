#! /bin/bash
#
# owncloud  -- a simplest owncloud tool for CLI
#
# copyright (c) 2018 Cj-bc
#
# This software is relesed under MIT Lisence.
# http://opensource.org/license/mit-license.php

version=0.0.1

OWNCLOUD_PATH="${brew --prefix}/Cellar/owncloud/${version}/"

source ${OWNCLOUD_PATH}/.sourcefiles

# set attribute. if no arg, show help
[ $# -ne 0 ] && attrib=$1 || attrib="help"
[ "$attrib" -ne "help" ] && shift # if first arg was option, shift.

case "$attrib" in
  "share" | "get" | "post" | "ls" | "mv" | "cp" | "mkdir" | "rm" | "help" )
    $attrib $@;;
  * )
    usage;;
esac
