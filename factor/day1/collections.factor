USING: arrays io kernel math math.intervals prettyprint sequences assocs ;

"------------------------" print

{ 1 2 3 4 } .

{ { "one" 1 } { "two" 2 } { "three" 3 } } .

"one" { { "one" 1 } { "two" 2 } { "three" 3 } } at .

{ { "one" 1 } { "two" 2 } { "three" 3 } } "two" of .

5 10 [a,b] .

1 2 3 4 4array .
1 2 3 4 4array { 1 2 3 4 } = .

2 { 5 6 7 8 } nth .
