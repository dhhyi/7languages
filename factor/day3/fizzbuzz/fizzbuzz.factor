USING: kernel math present ;
IN: day3.fizzbuzz

: fizzbuzz-traditional ( n -- s )
    dup
    15 mod 0 =
    [ drop "fizzbuzz" ]
    [
        dup 3 mod 0 =
        [ drop "fizz" ]
        [
            dup 5 mod 0 =
            [ drop "buzz" ]
            [ present ]
            if
        ]
        if
    ]
    if
    ;

: mult? ( x/str n -- ? )
    over number? [ mod 0 = ] [ 2drop f ] if ;

: when-mult ( x/str n str -- x/str )
    pick [ mult? ] 2dip ? ;

: fizz ( n -- s ) 3 "fizz" when-mult ;
: buzz ( n -- s ) 5 "buzz" when-mult ;
: fizzbuzz ( n -- s ) 15 "fizzbuzz" when-mult ;

: fizzbuzz-pipeline ( x -- str ) fizzbuzz fizz buzz present ;
