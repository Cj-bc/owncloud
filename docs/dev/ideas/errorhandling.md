# how to detect error
  * whether XML contains keyword 'error'
    ->  but if file or directry has name/word 'error',
        it might be treat as error, THOUGH IT ISN'T ERROR
          = can't use this way

  * how about "\<d:error"?

  * now I make a new temp file for shaping erro message output.
    but why don't 


# systemmap

            |input $1|
                |
                | is it file name?
        |---------------------|
   true |                     | false
        |                     |
  |set tmp=$1|      |make tmp contains $1|
        |                     |
        |---------------------|
                |             
                | "\<d:error" is detect in $tmp?
                |-------------|
           true |             | false
                |          |return 0|            
                |  
  |cut out XML tag using ex and save $tmp|
                |             
    |cat "$tmp" contants to stdout|
                |             
          |remove $tmp|
                |
    |return $NumERROR_APIRETURNERROR|
