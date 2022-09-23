print "----------------"

function is_prime(num)
    for i = 2, num - 1 do
        if num % i == 0
        then
            return false
        end
    end
    return true
end

for i = 1, 23, 2 do
    print(i .. " is prime: " .. tostring(is_prime(i)))
end
