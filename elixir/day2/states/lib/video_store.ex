defmodule VideoStore do
  def renting(video) do
    vid = log(video, "Renting #{video.title}")
    %{vid | times_rented: vid.times_rented + 1}
  end

  def returning(video) do
    vid = log(video, "Returning #{video.title}")
  end

  def losing(video) do
    vid = log(video, "Losing #{video.title}")
  end

  def finding(video) do
    vid = log(video, "Finding #{video.title}")
  end

  def log(video, message) do
    %{video | log: [message | video.log]}
  end
end
