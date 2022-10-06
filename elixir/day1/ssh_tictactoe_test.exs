Code.require_file("ssh_tictactoe.exs", __DIR__)
ExUnit.start()

defmodule TicTacToeTest do
  use ExUnit.Case, async: true

  test "winner?" do
    assert TicTacToe.winner?([
             [:x, :x, :x],
             [nil, nil, nil],
             [nil, nil, nil]
           ]) == :x

    assert TicTacToe.winner?([
             [:x, :x, :o],
             [nil, nil, :o],
             [nil, nil, :o]
           ]) == :o

    assert TicTacToe.winner?([
             [:x, :x, :o],
             [nil, :x, :o],
             [nil, :o, :x]
           ]) == :x

    assert TicTacToe.winner?([
             [nil, nil, nil],
             [nil, nil, nil],
             [nil, nil, nil]
           ]) == nil

    assert TicTacToe.winner?([
             [:x, :o, :x],
             [:o, :x, :o],
             [nil, nil, nil]
           ]) == nil

    assert TicTacToe.winner?([
             [:x, :o, :x],
             [:o, :x, :o],
             [:o, :x, :o]
           ]) == nil

    assert TicTacToe.winner?([
             [nil, :x, nil],
             [nil, :x, nil],
             [nil, :x, nil]
           ]) == :x
  end

  test "other_player" do
    assert TicTacToe.other_player(:x) == :o
    assert TicTacToe.other_player(:o) == :x
    assert TicTacToe.other_player(:y) == nil
  end

  test "sort_points" do
    assert TicTacToe.sort_points(for x <- 0..2, y <- 0..2, do: {x, y}) == [
             {1, 1},
             {0, 0},
             {0, 2},
             {2, 0},
             {2, 2},
             {0, 1},
             {1, 0},
             {1, 2},
             {2, 1}
           ]
  end

  test "free_places" do
    assert TicTacToe.free_places([
             [:x, :o, :x],
             [:o, :x, :o],
             [:o, :x, :o]
           ]) == []

    assert TicTacToe.free_places([
             [:x, :x, :o],
             [nil, :x, :o],
             [nil, :o, :x]
           ]) == [
             {1, 0},
             {2, 0}
           ]

    assert TicTacToe.free_places([
             [:x, nil, :o],
             [nil, :x, :o],
             [nil, :o, nil]
           ]) == [
             {0, 1},
             {1, 0},
             {2, 0},
             {2, 2}
           ]
  end

  test "place_player" do
    assert [
             [:x, :x, :o],
             [nil, :x, :o],
             [nil, :o, :x]
           ]
           |> TicTacToe.place_player(
             :o,
             {1, 0}
           ) == [
             [:x, :x, :o],
             [:o, :x, :o],
             [nil, :o, :x]
           ]

    assert [
             [:x, :x, :o],
             [nil, :x, :o],
             [nil, :o, :x]
           ]
           |> TicTacToe.place_player(
             :o,
             {1, 0}
           )
           |> TicTacToe.place_player(
             :o,
             {2, 0}
           ) == [
             [:x, :x, :o],
             [:o, :x, :o],
             [:o, :o, :x]
           ]
  end

  test "win_in_one_move" do
    assert [
             [:x, :x, nil],
             [nil, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_one_move(:x) == [
             {0, 2}
           ]

    assert [
             [:x, :x, nil],
             [:x, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_one_move(:x) == [
             {0, 2},
             {2, 0}
           ]

    assert [
             [nil, :x, nil],
             [nil, :x, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_one_move(:x) == [
             {2, 1}
           ]

    assert [
             [:x, :x, nil],
             [:x, :x, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_one_move(:x) == [
             {0, 2},
             {2, 0},
             {2, 2},
             {1, 2},
             {2, 1}
           ]

    assert [
             [:x, :x, nil],
             [:x, :x, :o],
             [:o, nil, :o]
           ]
           |> TicTacToe.win_in_one_move(:o) == [
             {0, 2},
             {2, 1}
           ]

    assert [
             [:x, :x, nil],
             [:x, :x, :o],
             [:o, nil, :o]
           ]
           |> TicTacToe.win_in_one_move(:x) == [
             {0, 2},
             {2, 1}
           ]
  end

  test "win_in_two_moves" do
    assert [
             [:x, nil, nil],
             [nil, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_two_moves(:x) == [
             {1, 1},
             {0, 2},
             {2, 0},
             {2, 2},
             {0, 1},
             {1, 0}
           ]

    assert [
             [nil, nil, nil],
             [nil, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_two_moves(:x) == []

    assert [
             [nil, nil, nil],
             [nil, :x, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_two_moves(:x) == [
             {2, 2},
             {2, 0},
             {0, 2},
             {0, 0},
             {0, 1},
             {1, 0},
             {1, 2},
             {2, 1}
           ]

    assert [
             [:o, nil, nil],
             [nil, :x, nil],
             [:o, nil, nil]
           ]
           |> TicTacToe.win_in_two_moves(:x) == [
             {0, 1},
             {1, 0},
             {1, 2},
             {2, 1}
           ]

    assert [
             [:o, nil, nil],
             [nil, :x, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.win_in_two_moves(:x) == [
             {2, 0},
             {0, 2},
             {0, 1},
             {1, 0},
             {1, 2},
             {2, 1}
           ]
  end

  test "best_move" do
    assert [
             [:x, :x, nil],
             [nil, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.best_move(:x) == {0, 2}

    assert [
             [:o, nil, :o],
             [:x, nil, nil],
             [:x, nil, nil]
           ]
           |> TicTacToe.best_move(:x) == {0, 1}

    assert ([
              [:o, nil, nil],
              [nil, :x, nil],
              [nil, nil, nil]
            ]
            |> TicTacToe.best_move(:x)) in [{0, 2}, {2, 0}]

    assert [
             [nil, nil, nil],
             [nil, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.best_move(:x) == {1, 1}

    assert [
             [nil, nil, nil],
             [:o, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.best_move(:x) == {1, 1}

    assert [
             [:o, nil, nil],
             [nil, nil, nil],
             [nil, nil, nil]
           ]
           |> TicTacToe.best_move(:x) == {1, 1}

    assert ([
              [nil, nil, nil],
              [nil, :o, nil],
              [nil, nil, nil]
            ]
            |> TicTacToe.best_move(:x)) in [{0, 0}, {0, 2}, {2, 0}, {2, 2}]

    assert [
             [:x, :o, :x],
             [nil, :o, nil],
             [:o, :x, nil]
           ]
           |> TicTacToe.best_move(:x) == {2, 2}

    assert [
             [:x, :o, :x],
             [:x, :o, :o],
             [:o, :x, :x]
           ]
           |> TicTacToe.best_move(:x) == nil
  end

  test "dump" do
    assert TicTacToe.dump([
             [:x, :x, :x],
             [nil, :o, nil],
             [nil, nil, :x]
           ]) == "x x x\n  o  \n    x"

    assert TicTacToe.dump([
             [:x, :o, :x],
             [:o, :x, :o],
             [:o, :x, :o]
           ]) == "x o x\no x o\no x o"
  end

  test "dump_cell" do
    assert TicTacToe.dump_cell(:x) == "x"
    assert TicTacToe.dump_cell(:o) == "o"
    assert TicTacToe.dump_cell(nil) == " "
    assert TicTacToe.dump_cell(:a) == " "
  end
end
