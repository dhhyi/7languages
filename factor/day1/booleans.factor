USING: io kernel math prettyprint sequences ;

"------------------------" print

[ 3 2 = ] dup . call .
[ 3 3 = ] dup . call .
[ 3 2 > ] dup . call .
[ 3 2 < ] dup . call .

"------------------------" print

[ "one" length 2 = ] dup . call .
[ "one" length "two" length = ] dup . call .

"------------------------" print

[ t f = ] dup . call .
[ t f and ] dup . call .
[ t f or ] dup . call .
[ t not ] dup . call .
[ t not f = ] dup . call .
