USING: io kernel math math.intervals prettyprint sequences assocs ;

"------------------------" print

{ 1 2 3 4 } .

{ { "one" 1 } { "two" 2 } { "three" 3 } } .

"one" { { "one" 1 } { "two" 2 } { "three" 3 } } at .

{ { "one" 1 } { "two" 2 } { "three" 3 } } "two" of .

5 10 [a,b] .
