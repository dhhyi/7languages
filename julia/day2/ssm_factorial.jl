using Distributed

println("-----------------")

function factorial(n)
    if n == 0
        return 1
    else
        return n * factorial(n - 1)
    end
end

println(factorial(5))

println("-----------------")

function factorial_distributed(n)
    @distributed (*) for i in 1:n
        i
    end
end

println(factorial_distributed(5))
