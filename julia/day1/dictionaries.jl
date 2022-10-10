println("------------------")

dict = Dict(:a => 1, :b => 2, :c => 3)

println(dict)
println(typeof(dict))
println(dict[:a])
println(keys(dict))
println(values(dict))

println("------------------")

println(get(dict, :d, 0))
println(dict)
println(haskey(dict, :d))
println(get!(dict, :d, 0))
println(dict)
println(haskey(dict, :d))

println("------------------")

println(in(:a => 1, dict))
println(in(:a => 2, dict))
println(in(:a, keys(dict)))
