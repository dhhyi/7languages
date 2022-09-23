print "-----------------"

function reduce(max, init, f)
    local acc = init
    for i = 1, max do
        acc = f(acc, i)
    end
    return acc
end

print "-- sum"
function sum(a, b)
    return a + b
end

print(reduce(5, 0, sum))

print "-- factorial"

function product(a, b)
    return a * b
end

function factorial(n)
    return reduce(n, 1, product)
end

print(factorial(5))
print(1 * 2 * 3 * 4 * 5)

print "-- fibonacci"

function fib_next_pair(arr)
    return { arr[2], arr[1] + arr[2] }
end

function fib(n)
    return reduce(n - 1, { 0, 1 }, fib_next_pair)[2]
end

print(fib(5))
