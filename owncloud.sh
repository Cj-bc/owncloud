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

source ${OWNCLOUD_PATH}/config


attrib=$1


