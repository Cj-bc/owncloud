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


# get specified file
function ownget {
  
  response=`curl -X ${API_GETFILE[0]} -u "$USER:$PASSWD" -s "${API_GETFILE[1]}/$1" > ${1##*/}`
  echo $response
}

# ls specified directory
function ownls {

  response=$(mktemp "/tmp/${0##*/}.tmp.XXXXXX")
  [ $# -eq 0 ] && local path="" || local path=$1
  curl -X ${API_GETFILELIST[0]} -u "$USER:$PASSWD" -s "${API_GETFILELIST[1]}/$path" -o "$response"

  ex -s "$response" <<-EOT
    %s/</\r</g
    g/>$/d
    g/^<d:[^h]/d
    1d
    %s/<d:href>.*\///g
    %s/<[^>]*>//g
    g/^$/d
    w!
EOT
  cat "$response"
}


# this function needs 2 argunments
#   -- upload path
#   -- file itself
function ownpost {

  response=`curl -X ${API_POSTFILE[0]} -u "$USER:$PASSWD" -s "${API_POSTFILE[1]}/$1" --data-binary @$2`

  [ $? -ne 0 ] && echo "ERROR: POSTING WAS FAILED" || echo "File is posted correctory." # if error has occured, output it.if not, output succeed
  [ "$response" != "" ] && echo "ERROR: POSTING WAS FAILED" || echo "File is posted correctory." # if error has occured, output it.if not, output succeed
}


function ownmkdir {

  response=`curl -X ${API_MKDIR[0]} -u "$USER:$PASSWD" -s "${API_MKDIR[1]}/$1"`

  [ $? -ne 0 ] && echo "ERROR: FAILED TO MKDIR $1" || echo "Make specified directory correctory." # if error has occured, output it.if not, output succeed
  [ "$response" != "" ] && echo "ERROR: FAILED TO MKDIR $1" || echo "Make specified directory correctory." # if error has occured, output it.if not, output succeed
}


function ownrm {

  response=`curl -X ${API_RMFILE[0]} -u "$USER:$PASSWD" -s "${API_RMFILE[1]}/$1"`


  [ "$response" != "" ] && echo "ERROR: FAILED TO remove $1" || echo "Remove specified directory correctory." # if error has occured, output it.if not, output succeed
}
