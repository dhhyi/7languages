print "----------------"

function Triple(x)
    return x * 3
end

print(Triple(3))

print "----------------"

print((function(num) return num * 3 end)(3))

print "----------------"

function Call_twice(f)
    local ff = function(num)
        return f(f(num))
    end
    return ff
end

print(Call_twice(Triple)(3))
