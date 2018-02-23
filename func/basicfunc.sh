#! /bin/bash
#
# basicfunc.sh    -- library for owncloud.sh
#                    Related with share attribute
#
# copyright (c) 2018 Cj-bc
#
# This software is relesed under MIT Lisence.
# http://opensource.org/license/mit-license.php

#
# Input: <attribute> <option1> <option2> <option3> ...
# Aim: execute API

function usage {
  echo $USAGE
  return $NumUSAGE
}

function ownget {
  
  if [ $# -eq 0 ]
  then
    response=`curl -X $API_GETFILELIST[0] -u $USER:$PASSWD "$API_GETFILELIST[1]" -s`
  else
    response=`curl -X $API_GETFILE[0] -u $USER:$PASSWD "$API_GETFILE[1]/$1" -s` 
  fi

  outData $response
}

function own
