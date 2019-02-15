#!/bin/bash
shopt -s extglob

verbs="post cp mv get ls mkdir rm config help -v version"
caseverb="@(${verbs// /|})"
testv="testv"
quotetest="quote"
listofv="get pos"

  case "$1" in
    a | b ) echo "$1";; 
    $testv ) echo testv;;
    "$quotetest" ) echo Quoted-v;;
    @(${listofv// /|}) ) echo list;;
    @(${verbs// /|}) ) echo expanded;;
    * ) echo wildcard;;
  esac

