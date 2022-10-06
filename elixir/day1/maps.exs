IO.puts("----------------------")

map = %{:name => "John", "height" => 1.80, age: 27, address: %{street: "Main", number: 123}}
IO.inspect(map)

IO.puts(map[:name])
IO.puts(map.age)
IO.puts(map["height"])
IO.puts(map.address.street)

IO.puts("----------------------")

map = put_in(map.address.street, "New Street")
IO.puts(map.address.street)

IO.puts("----------------------")
%{name: name, age: age} = map
IO.puts(name)
IO.puts(age)
