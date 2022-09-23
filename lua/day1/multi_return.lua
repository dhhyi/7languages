print "----------------"

function multi_return()
    return "a", "b", "c"
end

print(multi_return())

print "-- overassign"

local a, b, c, d = multi_return()

print("a:", a)
print("b:", b)
print("c:", c)
print("d:", d)

print "-- underassign"

local e, f = multi_return()

print("e:", e)
print("f:", f)
