IO.puts("--------------")

IO.puts("give car to valet")

valet =
  Task.async(fn ->
    Process.sleep(500)
    IO.puts("parking car")
    Process.sleep(2000)
    IO.puts("car ready")
  end)

IO.puts("shopping")

Process.sleep(1000)

IO.puts("more shopping")

IO.puts("waiting for car")

Task.await(valet)

IO.puts("drive away")
