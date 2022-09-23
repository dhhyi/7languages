---@diagnostic disable: lowercase-global
print "----------------"

function triple(x)
    return x * 3
end

print(triple(3))

print "----------------"

print((function(num) return num * 3 end)(3))

print "----------------"

function call_twice(f)
    ff = function(num)
        return f(f(num))
    end
    return ff
end

print(call_twice(triple)(3))
