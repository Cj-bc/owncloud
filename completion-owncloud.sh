#!/bin/bash
#
# This contains completion functions of owncloud for bash
#
# copyright (c) 2018 Cj-bc
#
# This software is relesed under MIT Lisence.
# http://opensource.org/license/mit-license.php

shopt -s extglob # to use @()

verbs="post cp mv get ls mkdir rm config help -v version"
flags="--local "

function setVerbAsRep {
  COMPREPLY=( $(compgen -W "$verbs" -- "$cur") )
}

function _owncloud-completion {

  local cur prev cword
  _get_comp_words_by_ref -n : cur prev cword
  [ "${COMP_WORDS[1]}" = "--local" ] && verb="${COMP_WORDS[2]:-local}" || verb="${COMP_WORDS[1]:-noverb}"

  case "$verb" in
    "config" ) COMPREPLY="edit";;
    "post" ) COMPREPLY=( $(compgen -f -- "$cur"));;
    "noverb" ) COMPREPLY=( $(compgen -W "${flags}${verbs}" -- "$cur") );;
    "local" ) COMPREPLY=( $(compgen -W "$verbs" -- "$cur") );;
    @(${verbs// /|}) ) : ;;
    * ) COMPREPLY=( $(compgen -W "${flags}${verbs}" -- "$cur") );;
  esac
}

complete -F _owncloud-completion owncloud
