include("flip_coins.jl")

function flip_coins_histogram(trials, times)
    bars = zeros(Int, times + 1)
    for i = 1:trials
        bars[pflip_coin(times)+1] += 1
    end
    hist = pmap(len -> repeat("*", len), bars)
    for line in hist
        println("|", line)
    end
end

flip_coins_histogram(100, 10)
