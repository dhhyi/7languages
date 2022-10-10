println("-----------------")

set = Set([1, 2, 3, 1, 2, 3])

println(set)

println("-----------------")

println(1 in set)

other = Set([3, 4, 5, 6])
println(intersect(set, other))
println(setdiff(set, other))
println(issubset(other, set))
println(issubset(Set([1, 2]), set))
