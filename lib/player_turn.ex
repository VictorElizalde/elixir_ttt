defmodule PlayerTurn do
  import Integer, only: [is_even: 1]

  def current_player_token(board) do
    if player_x_turn?(board), do: "X", else: "O"
  end

  def player_x_turn?(board) do
    Enum.filter(board, fn(position) -> has_token?(position) end) |> length |> is_even
  end

  def has_token?(position) do
    !is_integer(position)
  end
end