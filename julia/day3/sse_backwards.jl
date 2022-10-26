println("-------------------")

macro backwards(body)
    if (body.head == :block)
        body.args = reverse(body.args)
    end
    return body
end

@backwards begin
    println("1")
    println("2")
    println("3")
end

@backwards println("only")
