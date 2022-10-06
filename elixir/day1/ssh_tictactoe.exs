defmodule TicTacToe do
  def winner?([[x, x, x], [_, _, _], [_, _, _]]) when x != nil, do: x
  def winner?([[_, _, _], [x, x, x], [_, _, _]]) when x != nil, do: x
  def winner?([[_, _, _], [_, _, _], [x, x, x]]) when x != nil, do: x
  def winner?([[x, _, _], [x, _, _], [x, _, _]]) when x != nil, do: x
  def winner?([[_, x, _], [_, x, _], [_, x, _]]) when x != nil, do: x
  def winner?([[_, _, x], [_, _, x], [_, _, x]]) when x != nil, do: x
  def winner?([[x, _, _], [_, x, _], [_, _, x]]) when x != nil, do: x
  def winner?([[_, _, x], [_, x, _], [x, _, _]]) when x != nil, do: x
  def winner?(_), do: nil

  def free_places(board) do
    board
    |> Enum.with_index()
    |> Enum.flat_map(fn {row, row_index} ->
      row
      |> Enum.with_index()
      |> Enum.map(fn {cell, cell_index} ->
        if cell == nil do
          {row_index, cell_index}
        end
      end)
    end)
    |> Enum.reject(fn x -> x == nil end)
  end

  def other_player(:x), do: :o
  def other_player(:o), do: :x
  def other_player(_), do: nil

  def sort_points(list) do
    Enum.sort(list, fn {x1, y1}, {x2, y2} ->
      cond do
        x1 == 1 and y1 == 1 -> true
        x2 == 1 and y2 == 1 -> false
        rem(x1, 2) == 0 and rem(y1, 2) == 0 -> true
        rem(x2, 2) == 0 and rem(y2, 2) == 0 -> false
        x1 == x2 -> y1 < y2
        true -> x1 < x2
      end
    end)
  end

  def place_player(board, player, {x, y}) do
    board
    |> Enum.with_index()
    |> Enum.map(fn {row, row_index} ->
      row
      |> Enum.with_index()
      |> Enum.map(fn {cell, col_index} ->
        if row_index == x and col_index == y do
          player
        else
          cell
        end
      end)
    end)
  end

  def win_in_one_move(board, player) do
    board
    |> free_places()
    |> Enum.filter(fn point ->
      board
      |> place_player(player, point)
      |> winner?() == player
    end)
    |> sort_points()
  end

  def win_in_two_moves(board, player) do
    board
    |> free_places()
    |> Enum.map(fn point ->
      board
      |> place_player(player, point)
      |> win_in_one_move(player)
    end)
    |> List.flatten()
    |> sort_points()
  end

  def best_move(board, player) do
    board |> win_in_one_move(player) |> List.first() ||
      board |> win_in_one_move(other_player(player)) |> List.first() ||
      board |> win_in_two_moves(player) |> List.first() ||
      board |> free_places() |> sort_points() |> List.first()
  end

  def dump_cell(x) when x == :x or x == :o, do: to_string(x)
  def dump_cell(_), do: " "

  def dump(board) do
    board
    |> Enum.map(fn line ->
      Enum.map(line, fn x -> dump_cell(x) end)
      |> Enum.join(" ")
    end)
    |> Enum.join("\n")
  end
end
