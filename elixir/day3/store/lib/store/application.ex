defmodule Store.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, videos) do
    children = [
      {DynamicSupervisor, [strategy: :one_for_one, name: DSUP]}
    ]

    on_start = Supervisor.start_link(children, strategy: :one_for_one, name: SUP)

    Task.start(__MODULE__, :do_stuff, [videos])
    on_start
  end

  def do_stuff(videos) do
    Process.sleep(1000)

    spec = %{
      id: VIDSTORE,
      start: {States.Server, :start_link, [videos]},
      restart: :permanent
    }

    DynamicSupervisor.start_child(DSUP, spec)
  end
end
