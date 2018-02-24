#!/bin/bash

cache=0
[ $# -ne 0 ] && [ $1 == '--cache' ] && cache=1

echo "this is test file!!!! hello world" > test.txt && echo "test: test.txt generated"
echo "test start: mkdir";./owncloud.sh mkdir testdir
echo "test start: post";./owncloud.sh post test.txt testdir/test.txt
echo "test start: ls";./owncloud.sh ls testdir
echo "test start: get";./owncloud.sh get testdir/test.txt
if [ $cache -ne 1 ]
then
  echo "test start: rm";./owncloud.sh rm testdir
  rm test.txt && echo "test: test.txt removed"
fi
