IO.puts("----------------")

ball_glove = fn ->
  receive do
    {:pitch, pitcher} ->
      send(pitcher, {:catch, self()})
  end
end

catcher = spawn(ball_glove)

send(catcher, {:pitch, self()})

receive do
  {:catch, catcher} ->
    IO.puts("Got the ball!")
    IO.inspect(catcher)
end
