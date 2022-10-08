defmodule Store.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, videos) do
    children = [
      %{
        id: States.Server,
        start: {States.Server, :start_link, [videos]}
      }
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: SUP)
  end
end
