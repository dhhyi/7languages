IO.puts("------------")
is_atom(:foo) |> IO.inspect()

atom = String.to_atom("foo")

is_atom(atom) |> IO.inspect()

is_atom(String.to_existing_atom("foo")) |> IO.inspect()

(String.to_existing_atom("foo") == atom) |> IO.inspect()
