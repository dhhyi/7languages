print "----------------"

function ends_in_3(num)
    return num % 10 == 3
end

print(ends_in_3(13))
print(ends_in_3(12))

print "----------------"

function is_prime(num)
    for i = 2, num - 1 do
        if num % i == 0 then
            return false
        end
    end

    return true
end

function print_first_n_primes(num)
    local i = 1
    local found = 0
    while true do
        if ends_in_3(i) and is_prime(i) then
            print(i)
            found = found + 1
            if found >= num then
                return
            end
        end
        i = i + 1
    end
end

print_first_n_primes(10)
