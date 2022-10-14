println("--------------------")

println([1, "two", 3.0, :four])

println(Float64[1, 2, 3])

println(zeros(Int64, 5))

println(ones(Int64, 5))

println(fill(:empty, 5))

println(fill(1:5, 5))

println("--------------------")

arr = [1, "two", 3.0, :four]

println(arr[1])
println(arr[end])

println(arr[1:2])
println(arr[2:end])

println("--------------------")

arr[1] = 5
println(arr)

arr[1:end] .= :a
println(arr)

arr[3:end] .= [:c, :d]
println(arr)
