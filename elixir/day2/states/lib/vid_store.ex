defmodule VidStore do
  use StateMachine

  def log(video, message) do
    %{video | log: [message | video.log]}
  end

  state(:available,
    rent: [to: :rented]
  )

  def before_rent(video), do: log(video, "Renting #{video.title}")

  def after_rent(video) do
    %{video | times_rented: video.times_rented + 1}
  end

  state(:rented,
    return: [to: :available],
    lose: [to: :lost]
  )

  def before_return(video), do: log(video, "Returning #{video.title}")

  def before_lose(video), do: log(video, "Losing #{video.title}")

  state(:lost, find: [to: :rented])

  def before_find(video), do: log(video, "Finding #{video.title}")
end
