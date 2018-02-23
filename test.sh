#!/bin/bash

echo "this is test file!!!! hello world" > test.txt
./owncloud.sh post test.txt testdir/test.txt || echo "owncloud.sh post ERROR"
./owncloud.sh ls testdir || echo "owncloud.sh ls ERROR:"
./owncloud.sh get testdir/test.txt || echo "owncloud.sh get ERROR:"
