USING: io kernel math math.parser prettyprint sequences strings ;

"------------------------" print

42 [ 10 /i ] [ 10 mod ] bi
get-datastack .

clear

"------------------------" print

2342 number>string [ 1string string>number ] each
get-datastack .

clear
