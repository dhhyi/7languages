defmodule States.Server do
  use GenServer
  require VidStore

  def start_link(videos) do
    IO.puts("starting server")
    GenServer.start(__MODULE__, videos, name: __MODULE__)
  end

  def init(videos) do
    IO.puts("initializing server")
    {:ok, videos}
  end

  def handle_call({action, item}, _from, videos) do
    IO.puts("handling call #{action} #{item}")

    video = videos[item]

    if function_exported?(VidStore, action, 1) do
      new_video = apply(VidStore, action, [video])
      {:reply, new_video, Keyword.put(videos, item, new_video)}
    else
      # raise "Unknown action: #{action}"

      {:stop, "Unknown action: #{action}", videos}
    end
  end

  def handle_cast({:add, video}, videos) do
    {:noreply, [video | videos]}
  end
end
