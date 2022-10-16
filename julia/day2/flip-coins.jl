println("----------------------")

t = 10000000000

function flip_coin(times)
    heads = 0
    for i in 1:times
        if rand(Bool)
            heads += 1
        end
    end
    return heads
end

println(@time flip_coin(t))

using Distributed
addprocs(8)
function pflip_coin(times)
    @distributed (+) for i in 1:times
        Int(rand(Bool))
    end
end

println(@time pflip_coin(t))
