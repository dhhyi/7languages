defmodule ConcreteTest do
  import Should
  use ExUnit.Case

  should "update count" do
    rented_video = VideoStore.renting(video())
    assert rented_video.times_rented == 1
  end

  should "rent video" do
    rented_video = VideoStore.Concrete.rent(video())
    assert rented_video.state == :rented
    assert Enum.count(rented_video.log) == 1
  end

  should "handle multiple transitions" do
    import VideoStore.Concrete
    vid = video() |> rent |> return |> rent |> return
    assert vid.state == :available
    assert vid.times_rented == 2
    assert Enum.count(vid.log) == 4
  end

  def video, do: %Video{title: "The Matrix"}
end
