(cat <<EOF
Process.sleep(3000)
[{_, pid, _, _}] = Supervisor.which_children(DSUP)
pid
Process.sleep(1000)
GenServer.cast(pid, {:add, {:matrix, %Video{title: "The Matrix"}}})
Process.sleep(1000)
DynamicSupervisor.count_children(DSUP)
Process.sleep(1000)
GenServer.call(pid, {:rent, :matrix})
Process.sleep(1000)
DynamicSupervisor.count_children(DSUP)
Process.sleep(1000)
GenServer.call(pid, {:rentdfg, :matrix})
Process.sleep(3000)
DynamicSupervisor.count_children(DSUP)
Process.sleep(1000)
[{_, pid, _, _}] = Supervisor.which_children(DSUP)
pid
Process.sleep(1000)
GenServer.cast(pid, {:add, {:matrix, %Video{title: "The Matrix"}}})
Process.sleep(1000)
DynamicSupervisor.count_children(DSUP)
Process.sleep(1000)
GenServer.call(pid, {:rent, :matrix})
Process.sleep(1000)
DynamicSupervisor.count_children(DSUP)
EOF
) | iex -S mix
