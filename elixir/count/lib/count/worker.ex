defmodule Count.Worker do
  use GenServer

  def start_link(arg) when is_integer(arg) do
    IO.puts("starting counter")
    GenServer.start_link(__MODULE__, arg, name: :counter)
  end

  ## Callbacks

  @impl true
  def init(counter) do
    IO.puts("initializing counter")
    {:ok, counter}
  end

  @impl true
  def handle_call(:get, _from, counter) do
    {:reply, counter, counter}
  end

  def handle_call({:bump, value}, _from, counter) do
    {:reply, counter, counter + value}
  end

  def handle_call(_, _from, counter) do
    raise "unknown action"
  end
end
