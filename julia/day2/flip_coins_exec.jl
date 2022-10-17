include("flip-coins.jl")

println("----------------------")

t = 10000000000

println(@time flip_coin(t))

addprocs(8)

println(@time pflip_coin(t))
