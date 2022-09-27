USING: io kernel math prettyprint ;

"------------------------1" print

1 0 > [ "pos" ] [ "neg" ] if .
-1 0 > [ "pos" ] [ "neg" ] if .

"------------------------2" print

"cool" [ "yes" ] [ "no" ] if .

"------------------------3" print

1 0 > "pos" "neg" ? .
-1 0 > "pos" "neg" ? .

"------------------------4" print

1 0 > [ "pos" . ] when
-1 0 > [ "neg" . ] unless
