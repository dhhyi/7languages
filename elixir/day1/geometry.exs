defmodule Rectangle do
  def area({width, height}), do: width * height

  def perimeter({width, height}) do
    2 * (width + height)
  end
end

defmodule Square do
  def area({side}), do: Rectangle.area({side, side})

  def area({width, height}) when width == height do
    Rectangle.area({width, height})
  end

  def perimeter({side}), do: Rectangle.perimeter({side, side})

  def perimeter({width, height}) when width == height do
    Rectangle.perimeter({width, height})
  end
end

IO.puts("-----------------------------")

rect1 = {10, 20}
IO.puts("The area of the rectangle #{inspect(rect1)} is #{Rectangle.area(rect1)}")
IO.puts("The perimeter of the rectangle #{inspect(rect1)} is #{Rectangle.perimeter(rect1)}")

IO.puts("-----------------------------")

square1 = {10}
IO.puts("The area of the square #{inspect(square1)} is #{Square.area(square1)}")
IO.puts("The perimeter of the square #{inspect(square1)} is #{Square.perimeter(square1)}")

IO.puts("-----------------------------")

Square.area(rect1)
