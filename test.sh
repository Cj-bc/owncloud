#!/bin/bash

echo "this is test file!!!! hello world" > test.txt && echo "test: test.txt generated"
echo "test start: mkdir";./owncloud.sh mkdir testdir || echo "owncloud.sh mkdir ERROR"
echo "test start: post";./owncloud.sh post test.txt testdir/test.txt || echo "owncloud.sh post ERROR"
echo "test start: ls";./owncloud.sh ls testdir || echo "owncloud.sh ls ERROR:"
echo "test start: get";./owncloud.sh get testdir/test.txt || echo "owncloud.sh get ERROR:"
rm test.txt && echo "test: test.txt removed"
