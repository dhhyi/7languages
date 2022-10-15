println("--------------------")

function concat(a::Int64, b::Int64)
    zeros = ceil(log10(max(b + 1)))
    Int64(a * 10^zeros + b)
end

println(concat(10, 20))

println("--------------------")

function concat(a::Any, b::Any)
    "$a$b"
end

println(concat(11, "22"))

println(concat("33", 44))
