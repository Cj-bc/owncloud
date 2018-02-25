日本語はこちらへ  --> JP_README.md
# overview

  This is the simplest command utility for owncloud.
  Written in Shellscript for Bash.

# Installation

## OS X/Linux

  for mac and Linux, homebrew is available.
  you can just type

  ```
    $ brew tap Cj-bc/owncloud
    $ brew install owncloud
  ```

  to install this.

## Others

  no tools are supported yet.


# setting

  you should put "config" file at the same path as owncloud.sh
  and then write your configs:

  OWNCLOUDURL -- your owncloud's url.like `https://example.com/owncloud/`
                  which you use to log in from your browser!
  USER -- your username to log in owncloud
  PASSWD -- your password ( this isn't good way to store passwd,but I don't have other,,,)
