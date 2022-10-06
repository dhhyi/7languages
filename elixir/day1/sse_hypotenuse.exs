hypotenuse = fn
  a, b -> :math.sqrt(a * a + b * b)
end

IO.inspect(hypotenuse.(3, 4))
