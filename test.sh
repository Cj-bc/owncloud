#!/bin/bash

echo "this is test file!!!! hello world" > test.txt
./owncloud post test.txt testdir/test.txt || echo "owncloud post ERROR"
./owncloud ls testdir || echo "owncloud ls ERROR:"
./owncloud get testdir/test.txt || echo "owncloud get ERROR:"
