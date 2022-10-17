using Distributed

v = [1 2 3]

println(pmap(x -> x^2, v))
println(pmap(x -> "val: $x", v))
