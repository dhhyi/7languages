defmodule VidStoreTest do
  import Should
  import VidStore
  use ExUnit.Case

  should "update count" do
    rented_video = renting(video())
    assert rented_video.times_rented == 1
  end

  should "rent video" do
    rented_video = rent(video())
    assert rented_video.state == :rented
    assert Enum.count(rented_video.log) == 1
  end

  should "rent and lose video" do
    vid = video() |> rent() |> lose()
    assert vid.state == :lost
    assert Enum.count(vid.log) == 2
  end

  should "rent and lose and find and return video" do
    vid = video() |> rent() |> lose() |> find() |> return()
    assert vid.state == :available
    assert Enum.count(vid.log) == 4
  end

  should "handle multiple transitions" do
    vid = video() |> rent |> return |> rent |> return |> rent
    assert vid.state == :rented
    assert vid.times_rented == 3
    assert Enum.count(vid.log) == 5
  end

  def video, do: %Video{title: "The Matrix"}
end
