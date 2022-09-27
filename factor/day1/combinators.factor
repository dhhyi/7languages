USING: io kernel math prettyprint ;

"------------------------" print

50 dup 0.05 *
get-datastack .
swap 0.09975 *
get-datastack .

clear

"------------------------" print

50 [ 0.05 * ] [ 0.09975 * ] bi
get-datastack .

clear

"------------------------" print

10 15 [ 5 * ] bi@
get-datastack .

clear

"------------------------" print

10 15 [ 5 * ] [ 3 * ] bi*
get-datastack .

clear

"------------------------" print

10 15 [ 5 * ] dip
get-datastack .

clear

"------------------------" print

10 [ 5 * ] keep
get-datastack .

clear
