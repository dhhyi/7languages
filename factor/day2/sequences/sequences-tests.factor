USING: day2.sequences math math.ranges kernel sequences tools.test ;
IN: day2.sequences.tests

{ "a" } [ { "a" "b" "c" "d" } [ "a" = ] find-first ] unit-test

{ "b" } [ { "a" "b" "c" "d" } [ "b" = ] find-first ] unit-test

{ f } [ { "a" "b" "c" "d" } [ "e" = ] find-first ] unit-test

{ "four" } [ { "one" "two" "three" "four" } [ length 4 = ] find-first ] unit-test

{ "three" } [ { "one" "two" "three" "four" } [ length 4 > ] find-first ] unit-test

{ 42 } [ 1 100 [a,b] [ 41 > ] find-first ] unit-test
