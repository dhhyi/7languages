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
