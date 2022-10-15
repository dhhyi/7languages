println("----------------------")

using Distributed
addprocs(2)

println(workers())

r1 = remotecall(rand, 2, 100000000)
r2 = remotecall(rand, 3, 100000000)

println(length(fetch(r1)))
println(length(fetch(r2)))
