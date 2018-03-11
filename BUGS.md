here're rest bugs on this version

  * error 'ambiguous redirect' has occured in ownget. (discoved by coord.e)
    ```bash:ambiguous error by coord.e
       > owncloud get
       /home/linuxbrew/.linuxbrew/Cellar/
       owncloud/0.1.7/func/basicfunc.sh: line 43: $${1##*/}: ambiguous redirect
    ```
  * can't treat Japanese
  * no "help" command
  * \n,\r don't work in files which was given by "get" method
  * "get" method made a file which has only one line.
  * mkdir, rm, cp return success message though no argument was given.
