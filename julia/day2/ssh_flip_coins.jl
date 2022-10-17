
println("----------------------")

t = 10000000000

using Distributed

addprocs(8)

@everywhere include("flip_coins.jl")

function dflip_coin(times)
    w = length(workers())
    p = trunc(Int, times / w)
    r = times - (w - 1) * p

    partitions = [fill(p, w - 1); r]

    results = []

    for i in 1:w
        push!(results, @spawnat workers()[i] flip_coin(partitions[i]))
    end
    sum = 0
    for i in 1:w
        sum += fetch(results[i])
    end
    return sum
end

println("warming up")
dflip_coin(t)

println("running simple @distributed")
println(@time pflip_coin(t))

println("running @spawnat")
println(@time dflip_coin(t))

println("running simple @distributed")
println(@time pflip_coin(t))

println("running @spawnat")
println(@time dflip_coin(t))
