defmodule VidStore do
  use StateMachine

  def log(video, message) do
    %{video | log: [message | video.log]}
  end

  def before(event, video) do
    case event do
      :rent -> log(video, "Renting #{video.title}")
      :return -> log(video, "Returning #{video.title}")
      :lose -> log(video, "Losing #{video.title}")
      :find -> log(video, "Finding #{video.title}")
      _ -> video
    end
  end

  state(:available,
    rent: [to: :rented]
  )

  def after_rent(video) do
    %{video | times_rented: video.times_rented + 1}
  end

  state(:rented,
    return: [to: :available],
    lose: [to: :lost]
  )

  state(:lost, find: [to: :rented])
end
