
#! /bin/bash
#
# error.sh  -- library for owncloud.sh
#              Related with error treatment
#
# copyright (c) 2018 Cj-bc
#
# This software is relesed under MIT Lisence.
# http://opensource.org/license/mit-license.php

# input: <error_message> <error_code>
# aim: output error to console

function error {

  errorcode=$1;errorMessage=$2;

  cat <<-EOT 1>&2
    error has occured.
    Error code: $errorcode
    Message: 
        $errorMessage
EOT
}


function error_API {

  if [ -e "$1" ] # if given str is file name
  then
    tmp=$1
  else
    tmp=$(mktemp "/tmp/${0##*/}.tmp.XXXXXX") # make tmp file to edit request
    echo $1 > "$tmp"
  fi
    [ `cat $tmp | grep "<d:error" >/dev/null;echo $?` -eq 1 ] && return $SUCCESS # no error, return SUCCESS code

  # got error message from XML
  vim -e -s "$tmp" <<-EOT
    %s/<[^>]*>//g
    g/^$/d
    wq
EOT

  #return error code to stderror
  cat "$tmp" 1>&2
  rm "$tmp"

  return $NumERROR_APIRETURNERROR
}
