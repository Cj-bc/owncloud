#! /bin/bash
#
# owncloud  -- a simplest owncloud tool for CLI
#
# copyright (c) 2018 Cj-bc
#
# This software is relesed under MIT Lisence.
# http://opensource.org/license/mit-license.php

version=0.0.1

OWNCLOUD_PATH="`brew --prefix`/Cellar/owncloud/${version}/"

source ${OWNCLOUD_PATH}/.sourcefiles

# ----- set attribute. if no arg, show help
[ $# -ne 0 ] && attrib="own"$1 || attrib="help"
[ "$attrib" -ne "help" ] && shift # ---- if first arg was option, shift.

[ -p /dev/stdin ] && pipIn=`/dev/stdin` && attrib=ownpost # ---- if there's pip,read data from it, set to post it




case "$attrib" in
  "ownshare" | "ownget" | "ownpost" | "ownls" | "ownmv" | "owncp" | "ownmkdir" | "ownrm" | "ownhelp" )
    $attrib $@ $pipIn;; # pass pipIn(pipIn shuld be the data)
  * )
    usage;;
esac
