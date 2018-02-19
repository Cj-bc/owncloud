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

function shareget {

  if [ $1 != "" ]
  then
    curl -X $API_GETFILE[0] -u $USER:$PASSWD "$OWNCLOUDURL/$API_GETFILE[1]/$1" -s
  else
    curl -X $API_GETFILELIST[0] -u $USER:$PASSWD "$OWNCLOUDURL/$API_GETFILELIST[1]" -s
  fi

}

function shareinfo {



}

function shareshare {



}



function ownshare {

  case $1 in
    "get" ) shift;shareget $@;;
    "info" ) shift;shareinfo $@;;
    "share" ) shift;shareshare $@;;
    * ) error error
  esac


}
