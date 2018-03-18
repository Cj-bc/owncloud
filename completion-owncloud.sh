#!/bin/bash
#
# This contains completion functions of owncloud for bash
#
# copyright (c) 2018 Cj-bc
#
# This software is relesed under MIT Lisence.
# http://opensource.org/license/mit-license.php

verbs="post cp mv get ls mkdir rm config help -v version"
flags="--local "

function setVerbAsRep {
  COMPREPLY=( $(compgen -W "$verbs" -- "$cur") )
}

function _owncloud-completion {

  local cur prev cword
  _get_comp_words_by_ref -n : cur prev cword

  if [ "$cword" -eq 1 ]
  then
    COMPREPLY=( $(compgen -W "${flags}${verbs}" -- "$cur") )

  elif [ "$cword" -eq 2 ]
  then
    case "${prev}" in
      --local) setVerbAsRep;;
      config) COMPREPLY="edit";;
      post) COMPREPLY=( $(compgen -f -- "$cur"));;
    esac
  fi
}

complete -F _owncloud-completion owncloud
