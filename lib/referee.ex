defmodule Referee do
  import Board, only: [rows: 1, columns: 1, diagonals: 1]

  def winning_game?(board) do
    rows(board) ++ columns(board) ++ diagonals(board)
    |> Enum.any?(fn(line) -> winning_line?(line) end)
  end

  def game_over?(board) do
    winning_game?(board) || board_full?(board)    
  end

  def winning_line?(line) do
    (length Enum.uniq(line)) == 1
  end

  def board_full?(board) do
    Enum.filter(board, fn(x) -> is_integer(x) end) |> Enum.empty?
  end

  def empty_board?(board) do
    Enum.all?(board, fn(x) -> is_integer(x) end)
  end

  def tie?(board) do
    !winning_game?(board) || board_full?(board)
  end
end