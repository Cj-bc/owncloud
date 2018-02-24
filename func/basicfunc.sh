#! /bin/bash
#
# basicfunc.sh    -- library for owncloud.sh
#                    Related with basic attribute
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

# get specified file
function ownget {
  
  response=`curl -X ${API_GETFILE[0]} -u "$USER:$PASSWD" "${API_GETFILE[1]}/$1" -s > ${1##*/}`
  echo $response
}

# ls specified directory
function ownls {

  response=`curl -X ${API_GETFILELIST[0]} -u "$USER:$PASSWD" "${API_GETFILELIST[1]}/$1" -s`
  echo $response
}


# this function needs 2 argunments
#   -- upload path
#   -- file itself
function ownpost {

  response=`curl -X ${API_POSTFILE[0]} -u "$USER:$PASSWD" "${API_POSTFILE[1]}/$1" --data-binary @$2`

  [ $? -ne 0 ] && echo "ERROR: POSTING WAS FAILED" || echo "File is posted correctory." # if error has occured, output it.if not, output succeed
  [ "$response" != "" ] && echo "ERROR: POSTING WAS FAILED" || echo "File is posted correctory." # if error has occured, output it.if not, output succeed
}


function ownmkdir {

  response=`curl -X ${API_MKDIR[0]} -u "$USER:$PASSWD" "${API_MKDIR[1]}/$1"`

  [ $? -ne 0 ] && echo "ERROR: FAILED TO MKDIR $1" || echo "Make specified directory correctory." # if error has occured, output it.if not, output succeed
  [ "$response" != "" ] && echo "ERROR: FAILED TO MKDIR $1" || echo "Make specified directory correctory." # if error has occured, output it.if not, output succeed
}


function ownrm {

  response=`curl -X ${API_RMFILE[0]} -u "$USER:$PASSWD" "${API_RMFILE[1]}/$1"`


  [ "$response" != "" ] && echo "ERROR: FAILED TO remove $1" || echo "Remove specified directory correctory." # if error has occured, output it.if not, output succeed
}
