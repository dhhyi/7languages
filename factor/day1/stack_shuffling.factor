USING: io kernel prettyprint ;

"------------------------" print

1 2 3 4
get-datastack .
clear

"------------------------dup" print

1 2 3 4 dup

get-datastack .
clear

"------------------------over" print

1 2 3 4 over

get-datastack .
clear

"------------------------pick" print

1 2 3 4 pick

get-datastack .
clear

"------------------------drop" print

1 2 3 4 drop

get-datastack .
clear

"------------------------nip" print

1 2 3 4 nip

get-datastack .
clear

"------------------------swap" print

1 2 3 4 swap

get-datastack .
clear

"------------------------rot" print

1 2 3 4 rot

get-datastack .
clear

"------------------------rot rot" print

1 2 3 4 rot rot

get-datastack .
clear
