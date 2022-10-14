println("-------------------")

A = [1 2 3; 4 5 6; 7 8 9]
println(A)
println(size(A))

println("-------------------")

println(A[1, 1])
println(A[1:end, 2])
println(A[2, 1:end])
println(A[2, 1:2])
println(A[3, :])

println("-------------------")

A[2:end, 2:end] .= 0
println(A)

println("-------------------")

println(rand(Int16, 3, 3))
println(rand(Bool, 3, 3))
println(rand('a':'z', 3, 3))
println(rand('a':'z', 10))

println("-------------------")

using LinearAlgebra

println(I)
iden = Matrix{Int64}(I, 3, 3)
println(iden)
println(iden * 5)

println("-------------------")

v = [1, 2, 3]
println(v)
println(v')
println(v' * v)
println(v * v')
println(v .* v)
