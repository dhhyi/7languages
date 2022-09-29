USING: kernel tools.test math.ranges sequences ;
USE: day3.fizzbuzz
IN: day3.fizzbuzz.tests

CONSTANT: fizzbuzz-expected {
    { "1" "2" "fizz" "4" "buzz" "fizz" "7" "8" "fizz" "buzz" "11" "fizz" "13" "14" "fizzbuzz" "16" }
}

: range ( -- seq ) 1 16 [a,b] ;

fizzbuzz-expected [ range [ fizzbuzz-traditional ] map ] unit-test

fizzbuzz-expected [ range [ fizzbuzz-pipeline ] map ] unit-test
