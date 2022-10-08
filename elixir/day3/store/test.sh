(cat <<EOF
GenServer.cast(States.Server, {:add, {:matrix, %Video{title: "The Matrix"}}})
Process.sleep(1000)
GenServer.call(States.Server, {:rent, :matrix})
Process.sleep(1000)
GenServer.call(States.Server, {:rentdfg, :matrix})
Process.sleep(1000)
GenServer.cast(States.Server, {:add, {:matrix, %Video{title: "The Matrix"}}})
Process.sleep(1000)
GenServer.call(States.Server, {:rent, :matrix})
EOF
) | iex -S mix
