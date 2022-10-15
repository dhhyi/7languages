a = Dict("foo" => 0.0, "bar" => 42.0)

b = Dict("baz" => 17, "bar" => 4711)

println(merge(a, b))

println(merge(b, a))
