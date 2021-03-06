#!/bin/bash

cache=0;localflag=0
[ $# -ne 0 ] && [ $1 == '--cache' ] && cache=1 && shift
[ $# -ne 0 ] && [ $1 == '--local' ] && localflag=1

case $localflag in
  0)
    echo "this is test file!!!! hello world" > test.txt && echo "test: test.txt generated"
    echo "test start: mkdir";owncloud  mkdir testdir
    echo "test start: post";owncloud post test.txt testdir/test.txt
    echo "test start: ls";owncloud  ls testdir
    echo "test start: mv";owncloud  mv testdir/test.txt test.txt
    echo "test start: get";owncloud  get test.txt
    echo "data:\n>  ";cat test.txt
    if [ $cache -ne 1 ]
    then
      echo "test start: rm";owncloud rm testdir;owncloud rm test.txt
      rm test.txt && echo "test: test.txt removed"
    fi
    ;;
  1)
    echo "this is test file!!!! hello world" > test.txt && echo "test: test.txt generated"
    echo "test start: mkdir";./owncloud.sh --local mkdir testdir
    echo "test start: post";./owncloud.sh --local post test.txt testdir/test.txt
    echo "test start: ls";./owncloud.sh --local ls testdir
    echo "test start: mv";./owncloud.sh --local mv testdir/test.txt test.txt
    echo "test start: get";./owncloud.sh --local get test.txt
    echo "data:\n>  ";cat test.txt
    if [ $cache -ne 1 ]
    then
      echo "test start: rm";./owncloud.sh --local rm testdir;./owncloud.sh --local rm test.txt
      rm test.txt && echo "test: test.txt removed"
    fi
    ;;
esac
