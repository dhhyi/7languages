USING: io interpolate kernel math math.parser namespaces prettyprint random sequences ;
IN: day2.numberguess

SYMBOL: tries

: guess ( n -- b )
    tries get 0 =
    [
        drop
        f
    ]
    [
        "You have "
        tries get number>string append
        " tries left:" append print flush

        dup
        readln string>number
        dup rot

        = [ 2drop t ]
        [
            2dup > [ "Higher!" print ] [ "Lower!" print ] if drop
            tries dec guess
        ] if
    ] if
    ;

: start ( -- )
    10 tries set
    100 random 1 +
    dup . flush
    "Guess the number between 1 and 100" print flush

    dup guess

    [
        "You guessed correctly!" print flush drop
    ]
    [
        number>string
        "You didn't get it right. The number was: "
        swap append
        print flush
    ] if
    ;

MAIN: start
