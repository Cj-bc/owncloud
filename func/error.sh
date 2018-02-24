
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
