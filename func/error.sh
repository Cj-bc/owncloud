
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

  cat <<EOT
    error has occured.
    Error code: $errorcode
    Message: $errorMessage
EOT
}


function error_API {

  [ `cat $1 | grep "<d:error>"` ] || return $SUCCESS # no error, return SUCCESS code
  
  # got error message from XML
  tmp=$(mktemp "/tmp/${0##*/}.tmp.XXXXXX")
  ex -s "$tmp" <<-EOT
    %s/<[^>]*>//g
    g/^$/d
    wq
EOT

  #return error code to stderror
  cat "$tmp"
  rm "$tmp"

  return $NumERROR_APIRETURNERROR
}
