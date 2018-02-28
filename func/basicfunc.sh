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
    %s/\/$/*/g
    %s/<d:href>.*\///g
    %s/<[^>]*>//g
    %s/*$/\//g
    g/^$/d
    1d
    sort
    w!
EOT
  cat "$response"

  rm "$response"
}


# this function needs 2 argunments
#   -- upload path
#   -- file itself
function ownpost {

  response=`curl -X ${API_POSTFILE[0]} -u "$USER:$PASSWD" -s "${API_POSTFILE[1]}/$1" --data-binary @$2`

  [ $? -ne 0 ] && echo "ERROR: POSTING WAS FAILED" # if error has occured, output it.if not, output succeed
  [ "$response" != "" ] && echo "ERROR: POSTING WAS FAILED" || echo "\"$1\" is posted correctory." # if error has occured, output it.if not, output succeed
}


function ownmkdir {

  response=`curl -X ${API_MKDIR[0]} -u "$USER:$PASSWD" -s "${API_MKDIR[1]}/$1"`

  [ $? -ne 0 ] && echo "ERROR: FAILED TO MKDIR $1" # if error has occured, output it.if not, output succeed
  [ "$response" != "" ] && echo -e "ERROR: FAILED TO MKDIR $1.Response is below:\n\n${response}" || echo "Make \"$1\" correctory." # if error has occured, output it.if not, output succeed
}


function ownrm {

  response=`curl -X ${API_RMFILE[0]} -u "$USER:$PASSWD" -s "${API_RMFILE[1]}/$1"`


  [ "$response" != "" ] && echo "ERROR: FAILED TO remove $1" || echo "Remove \"$1\" correctory." # if error has occured, output it.if not, output succeed
}


function ownmv {
  
  response=`curl -X ${API_MVFILE[0]} -u "$USER:$PASSWD" -s --header "${DestURL}/$2" "${API_MVFILE[1]}/$1"`
   
  echo $response
  [ "$response" != "" ] && echo "ERROR: FAILED TO move $1" || echo "Move \"$1\" correctory." # if error has occured, output it.if not, output succeed
}

function owncp {

  response=`curl -X ${API_CPFILE[0]} -u "$USER:$PASSWD" -s --header "${DestURL}/$2" "${API_CPFILE[1]}/$1"`

  echo $response
  [ "$response" != "" ] && echo "ERROR: FAILED TO copy $1" || echo "Copy \"$1\" correctory." # if error has occured, output it.if not, output succeed

}
