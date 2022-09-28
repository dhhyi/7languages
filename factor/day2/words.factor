USING: io kernel math prettyprint sequences ;
IN: scratchpad

"------------------------" print

: add-42 ( n -- n' ) 42 + ;

3 add-42
get-datastack .

clear

"------------------------" print

: sum ( seq -- n ) 0 [ + ] reduce ;

{ 1 2 3 4 5 } sum
get-datastack .

clear

"------------------------" print

: first-two ( seq -- x y ) [ first ] [ second ] bi ;

{ 1 2 3 4 5 } first-two
get-datastack .

clear
