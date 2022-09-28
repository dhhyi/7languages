USING: io kernel math math.ranges prettyprint sequences ;
IN: scratchpad

"------------------------" print

: fib-next-pair ( n1 n2 -- n2 n1+n2 ) dup rot + ;

: fib ( n -- n )
    0 1 ! sequence start
    rot ! rotate argument to top of stack
    [ fib-next-pair ] times
    drop ;

5 fib .

"------------------------" print

1 10 [a,b] [ fib . ] each

clear
