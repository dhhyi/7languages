defmodule VidStore do
  use StateMachine

  state(:available,
    rent: [to: :rented, calls: [&VidStore.renting/1]]
  )

  state(:rented,
    return: [to: :available, calls: [&VidStore.returning/1]],
    lose: [to: :lost, calls: [&VidStore.losing/1]]
  )

  state(:lost, [])

  def renting(video) do
    vid = video |> log("Renting #{video.title}")
    %{vid | times_rented: vid.times_rented + 1}
  end

  def returning(video) do
    video |> log("Returning #{video.title}")
  end

  def losing(video) do
    video |> log("Losing #{video.title}")
  end

  def log(video, message) do
    %{video | log: [message | video.log]}
  end
end
