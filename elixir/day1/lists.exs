IO.puts("---------------")

list = [1, 2, 3, 4, 5]
IO.inspect(list)

IO.puts("----------------------")

IO.inspect(is_list(list))
IO.inspect(is_list("string"))
IO.inspect(is_list('char'))

IO.puts("----------------------")

IO.inspect(length(list))
IO.inspect(Enum.at(list, 0))

IO.puts("----------------------")

IO.inspect([1 | list])
IO.inspect([list | 1])
IO.inspect([0 | []])

IO.puts("----------------------")

[head | tail] = list
IO.inspect(head)
IO.inspect(tail)

IO.puts("----------------------")

[first, second | _] = list
IO.inspect(first)
IO.inspect(second)

IO.puts("----------------------")

defmodule Print do
  def print_list([]), do: :ok

  def print_list([head | tail]) do
    IO.puts(head)
    print_list(tail)
  end
end

Print.print_list(list)

IO.puts("----------------------")

Enum.each(list, &IO.puts(&1))

IO.puts("----------------------")

Enum.filter(list, fn x -> x > 2 end) |> IO.inspect()
Enum.reduce(list, &(&1 + &2)) |> IO.inspect()
Enum.all?(list, &(&1 > 5)) |> IO.inspect()
Enum.zip(list, [:a, :b, :c, :d, :e]) |> IO.inspect()

IO.puts("----------------------")

(list ++ [6, 7, 8]) |> IO.inspect()
(list -- [2, 3]) |> IO.inspect()
([2, 2, 2, 3, 4] -- [2, 3]) |> IO.inspect()
