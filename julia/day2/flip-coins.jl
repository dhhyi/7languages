function flip_coin(times)
    heads = 0
    for _ in 1:times
        if rand(Bool)
            heads += 1
        end
    end
    return heads
end

using Distributed

function pflip_coin(times)
    @distributed (+) for i in 1:times
        Int(rand(Bool))
    end
end
