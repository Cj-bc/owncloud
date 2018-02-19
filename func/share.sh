#! /bin/bash
#
# share.sh  -- library for owncloud.sh
#              Related with share attribute
#
# copyright (c) 2018 Cj-bc
#
# This software is relesed under MIT Lisence.
# http://opensource.org/license/mit-license.php

#
# Input: <attribute> <option1> <option2> <option3> ...
# Aim: execute API

function shareGet {

  if [ $1 != "" ]
  then
    curl -X $API_GETFILE[0] -u $USER:$PASSWD "$OWNCLOUDURL/$API_GETFILE[1]/$1" -s
  else
    curl -X $API_GETFILELIST[0] -u $USER:$PASSWD "$OWNCLOUDURL/$API_GETFILELIST[1]" -s
  fi

}

function shareInfo {



}

function shareShare {



}



function share {

  case $1 in
    "get" ) shift;shareGet $@;;
    "info" ) shift;shareInfo $@;;
    "share" ) shift;shareShare $@;;
    * ) error error
  esac


}
