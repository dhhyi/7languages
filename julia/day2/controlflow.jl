println("----------------------")

x = 10
if x < 10
    println("x is less than 10")
elseif x == 10
    println("x is equal to 10")
else
    println("x is greater than 10")
end

println("----------------------")

x = 4

while x < 10
    println(x)
    global x = x + 3
end

println("----------------------")

for i = [2, 4, 7]
    println("i = $i")
end

println("----------------------")

for i in 1:10
    println("at $i")
end

println("----------------------")

sum = 0
for i = 1:10
    global sum = sum + i
end
println("sum = $sum")

println("----------------------")

dict = Dict("a" => 1, "b" => 2, "c" => 3)

for (key, value) in dict
    println("$key => $value")
end
