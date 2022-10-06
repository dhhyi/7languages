words = [:one, :two, :two, :three, :three, :three]

# Create a map with the words as keys and the number of times they appear as values
Enum.reduce(words, %{}, fn word, acc ->
  Map.update(acc, word, 1, &(&1 + 1))
end)
|> IO.inspect()
