"-------------" println

// fib := method(num, if(num < 2, 1, fib(num - 1) + fib(num - 2)))

fib := method(num,
    if(num < 2, return 1)
    prevprev := 1
    prev := 1
    for(i, 0, num - 2, current := prev + prevprev; prevprev = prev; prev = current)
)

fib(1) println
fib(2) println
fib(3) println
fib(4) println
fib(5) println
fib(6) println
// fib(15) println
