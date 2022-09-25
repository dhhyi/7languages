---@diagnostic disable: lowercase-global
print "------------------"

function fibonacci()
    local a, b = 0, 1
    while true do
        coroutine.yield(b)
        a, b = b, a + b
    end
end

generator = coroutine.create(fibonacci)
repeat
    local succeeded, value = coroutine.resume(generator)
    print(value)
until not succeeded or value > 100

print "------------------"

function fib(n)
    local g = coroutine.create(fibonacci)
    local value
    for _ = 1, n do
        _, value = coroutine.resume(g)
    end
    return value
end

print(fib(5))
print(fib(50))
