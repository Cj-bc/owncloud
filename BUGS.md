here're rest bugs on this version

  * can't use error_API.it output nothing
      And don't work || and &&
  * error 'ambiguous redirect' has occured in ownget. (discoved by coord.e)
    ```bash:ambiguous error by coord.e
       > owncloud get
       /home/linuxbrew/.linuxbrew/Cellar/
       owncloud/0.1.7/func/basicfunc.sh: line 43: $${1##*/}: ambiguous redirect 
       owncloud/0.1.7/func/basicfunc.sh: line 43: $${1##*/}: ambiguous redirect
    ```
