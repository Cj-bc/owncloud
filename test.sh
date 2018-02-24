#!/bin/bash

[ $# -ne 0 ] && [ $1 == '--cache' ] && cache=1

echo "this is test file!!!! hello world" > test.txt && echo "test: test.txt generated"
echo "test start: mkdir";./owncloud.sh mkdir testdir && echo "test success: mkdir" || echo "owncloud.sh mkdir ERROR"
echo "test start: post";./owncloud.sh post test.txt testdir/test.txt && echo "test success:post" || echo "owncloud.sh post ERROR"
echo "test start: ls";./owncloud.sh ls testdir && echo "test success: ls" || echo "owncloud.sh ls ERROR:"
echo "test start: get";./owncloud.sh get testdir/test.txt && echo "test success:get" || echo "owncloud.sh get ERROR:"
if [ $cache -ne 1 ]
then
  echo "test start: rm";./owncloud.sh rm testdir && echo "test success:rm" || echo "owncloud.sh rm ERROR:"
  rm test.txt && echo "test: test.txt removed"
fi
