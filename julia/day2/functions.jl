println("--------------------")

function with_defaults(a, b=2, c=3)
    println("a = $a, b = $b, c = $c")
end

with_defaults(1)
with_defaults(1, 4)
with_defaults(1, 4, 5)

println("--------------------")

function with_varargs(a, b, c...)
    println("a = $a, b = $b, c = $c")
    for i in c
        println("vararg $i")
    end
end

with_varargs(1, 2)
with_varargs(1, 2, 3)
with_varargs(1, 2, 3, 4)
with_varargs(1, 2, 3, 4, 5)

println("--------------------")

println(+(1, 2))
println(+(1, 2, 3))
println(+(1:10...))

println("--------------------")

println(1:10)
println(1:10...)
