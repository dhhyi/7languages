println("-------------------")

macro unless(condition, body)
    return quote
        if !($condition)
            $body
        end
    end
end

a = [1, 2, 3, 4, 5]

@unless isempty(a) println("a is not empty")

@unless in(a, 6) println("6 is not in a")
