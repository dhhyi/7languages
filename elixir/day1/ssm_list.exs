defmodule Lists do
  def size([]), do: 0
  def size([_ | tail]), do: 1 + size(tail)

  def maximum([head | tail]), do: maximum(tail, head)
  def maximum([], maximum), do: maximum
  def maximum([new? | tail], maximum) when new? > maximum, do: maximum(tail, new?)
  def maximum([_ | tail], maximum), do: maximum(tail, maximum)

  def minimum([head | tail]), do: minimum(tail, head)
  def minimum([], minimum), do: minimum
  def minimum([new? | tail], minimum) when new? < minimum, do: minimum(tail, new?)
  def minimum([_ | tail], minimum), do: minimum(tail, minimum)
end

list = [2, 5, 4, 1, 3, 6, 0, 8, 9, 7]

Lists.size(list) |> IO.inspect()
Lists.maximum(list) |> IO.inspect()
Lists.minimum(list) |> IO.inspect()
