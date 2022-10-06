IO.puts("------------------")

for(x <- 1..5, do: x) |> IO.inspect()
for(x <- 1..3, y <- 1..3, do: {x, y}) |> IO.inspect()
for(x <- 1..3, y <- 1..3, x * y < 6, do: {x, y}) |> IO.inspect()

IO.puts("------------------")

defmodule Quicksort do
  def sort([]), do: []

  def sort([pivot | rest]) do
    left = for x <- rest, x <= pivot, do: x
    right = for x <- rest, x > pivot, do: x
    sort(left) ++ [pivot] ++ sort(right)
  end
end

list = [2, 7, 1, 4, 3, 6, 5]
IO.puts("Before: #{inspect(list)}")
IO.puts("After:  #{inspect(Quicksort.sort(list))}")
