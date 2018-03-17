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

# setting
function ownconfig {

  case "$1" in
    "edit" | "e") 
      [ $OWNCLOUD_PATH != "." ] && \
      ${EDITOR:-vi} `brew --prefix`/Cellar/owncloud/config ||\
      ${EDITOR:-vi} config;; # if you want use other editor,set $EDITOR
    "init") 
      config="`brew --prefix`/Cellar/owncloud/config"
      echo -en "Welcome to my setting section!\nwhat's the URL for your own/nextcloud?\nURL> "
      read stack;echo "OWNCLOUDURL=\"${stack}\"" > $config
      echo -en "Your name?\nusername> "
      read stack;echo "USER=\"${stack}\"" >> $config
      echo -en "Password?\n passwd> "
      read -s stack;echo -e "PASSWD=\"${stack}\"" >> $config
      echo -en "API? (`ls -m ${OWNCLOUD_PATH}/text/API/`)\nAPI> " #ls -m outputs <file>, <file>
      read stack;echo "API=\"${stack}\"" >> $config
      ;;
  esac
}


# get specified file
function ownget {
  
  error_Argument 1 $#
  response="`curl -X ${API_GETFILE[0]} -u "$USER:$PASSWD" -s "${API_GETFILE[1]}/$1"`"
  error_API "$response" # if error was found, the program will eixt with $NumERROR_APIRETURNERROR
  echo $response > "${1##*/}"
  return $SUCCESS
}

# ls specified directory
function ownls {

  response=$(mktemp "/tmp/${0##*/}.tmp.XXXXXX")
  [ $# -eq 0 ] && local path="" || local path=$1
  curl -X ${API_GETFILELIST[0]} -u "$USER:$PASSWD" -s "${API_GETFILELIST[1]}/$path" -o "$response"
  error_API "$response"

  vim -e -s "$response" <<-EOT
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

  cat $response
  rm "$response"
}


# this function needs 2 argunments
#   -- upload path
#   -- file itself
function ownpost {

  response=`curl -X ${API_POSTFILE[0]} -u "$USER:$PASSWD" -s "${API_POSTFILE[1]}/$2" --data-binary @$1`

  error_API "$response"

  echo "\"$1\" is posted correctory." # if error has occured, output it.if not, output succeed
  return $SUCCESS

}


function ownmkdir {

  error_Argument 1 $#
  response=`curl -X ${API_MKDIR[0]} -u "$USER:$PASSWD" -s "${API_MKDIR[1]}/$1"`

  error_API "$response"

 echo "Make \"$1\" correctory." # if error has occured, output it.if not, output succeed
 return $SUCCESS
}


function ownrm {

  error_Argument 2 $#
  response=`curl -X ${API_RMFILE[0]} -u "$USER:$PASSWD" -s "${API_RMFILE[1]}/$1"`


  error_API "$response"
  echo "Remove \"$1\" correctory." # if error has occured, output it.if not, output succeed
  return $SUCCESS
}


function ownmv {
  
  error_Argument 2 $#
  response=`curl -X ${API_MVFILE[0]} -u "$USER:$PASSWD" -s --header "${DestURL}/$2" "${API_MVFILE[1]}/$1"`
   
  error_API "$response"
  echo "Move \"$1\" correctory." # if error has occured, output it.if not, output succeed
  return $SUCCESS
}

function owncp {

  error_Argument 2 $#
  response=`curl -X ${API_CPFILE[0]} -u "$USER:$PASSWD" -s --header "${DestURL}/$2" "${API_CPFILE[1]}/$1"`

  error_API "$response"
  echo "Copy \"$1\" correctory." # if error has occured, output it.if not, output succeed
  return $SUCCESS
}
