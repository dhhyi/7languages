d = Dict{Symbol,Float16}()
d[:a] = 1.0

println(d)

d[:b] = :notanumber
