print "----------------"

function reverse(s, t)
    if s == nil or #s < 1 then
        return t
    end
    first = string.sub(s, 1, 1)
    rest = string.sub(s, 2)
    return reverse(rest, first .. (t or ""))
end

large = "This is a very large string that will be reversed"
-- large = string.rep("hello", 5000)
print(large)
print(reverse(large))
