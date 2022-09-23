---@diagnostic disable: lowercase-global
print "---------------"

function static_args(a1, a2)
    print("a1: ", a1)
    print("a2: ", a2)
end

function flex_args(expected, ...)
    print("exp:", expected)
    local args = { ... }
    if #args > 0 then print "extra" end
    for i, v in ipairs(args) do
        print("a" .. i .. ":", v)
    end
end

print "-- static_args a b"
static_args("a", "b")
print "-- static_args a"
static_args("a")
print "-- static_args"
static_args()
print "-- static_args a b c d"
---@diagnostic disable-next-line: redundant-parameter
static_args("a", "b", "c", "d")

print "-- flex_args a b c"
flex_args('a', 'b', 'c')
print "-- flex_args a"
flex_args('a')
