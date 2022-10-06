IO.puts("-----------------")

inc = fn x -> x + 1 end

IO.puts(inc.(1))

IO.puts("-----------------")

double_call = fn x, f -> f.(f.(x)) end

IO.puts(double_call.(2, inc))

IO.puts("-----------------")

add = &(&1 + &2)

IO.puts(add.(1, 2))

IO.puts("-----------------")

inc2 = &add.(&1, 1)

IO.puts(inc2.(1))

dec = &add.(&1, -1)

IO.puts(dec.(1))

IO.puts("-----------------")

IO.puts(10 |> inc.() |> inc.() |> inc.() |> dec.())
