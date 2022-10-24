function show_expression(expr)
    println("e = ", expr)

    println("typeof(e) = ", typeof(expr))
    println("e.head = ", expr.head)
    println("e.args = ", expr.args)

    println(eval(expr))
end

println("--------------------")

e1 = :(println("Hello"))

show_expression(e1)

println("--------------------")

e2 = :(x = 5)

show_expression(e2)

println("--------------------")

e3 = Expr(:call, +, 1, 2, 3, 4, 5)

show_expression(e3)

println("--------------------")

e4 = :(println($x))

show_expression(e4)

println("--------------------")

e5 = quote
    println("Hello")
end

show_expression(e5)
