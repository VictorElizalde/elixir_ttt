defmodule ComputerPlayer do
  import Referee, only: [available_moves: 1, winning_game?: 1, game_over?: 1]
  import PlayerTurn, only: [current_player_token: 1]
  import Board

  defstruct token: "O"

  def computer_move(board, token) do
    set_token_at(board, optimal_move(board, token) + 1, token)
  end
  
  def optimal_move(board, token) do
    move = Enum.max_by(scored_moves(board, token), &(&1.score))
    if move.position == nil, do: 0, else: move.position
  end

  def scored_moves(board, token) do
    available_moves(board) |> Enum.map(fn position -> 
    move_score(board, token, position) end)  
  end

  def move_score(board, token, position) do
    set_token_at(board, position + 1, token)
    |> apply_minimax(token, 1, position)
  end

  def minimax(board, token, depth) do
    Enum.map(available_moves(board), fn (position) ->
      new_board = set_token_at(board, position + 1, token)
      %{position: position, score: apply_minimax(new_board, token, depth, position)}
    end) |> best_score(current_player_token(board), token)
  end

  def apply_minimax(board, token, depth, position) do
    if game_over?(board) do
      %{position: position, score: score(board, token)}
    else
      minimax(board, token, depth + 1)
    end
  end
   
  def score(board, token) do
    if winning_game?(board) do
      if computer_player_win?(board, token), do: 20, else: -20 
    else
      0
    end
  end

  def best_score(moves, current_token, token) do
    if maximizing_player?(current_token, token) do
      Enum.reduce(moves, %{position: nil, score: -10}, fn move, acc ->
        if move.score > acc.score, do: move, else: acc
      end)
    else
      Enum.reduce(moves, %{position: nil, score: 10}, fn move, acc ->
        if move.score < acc.score, do: move, else: acc
      end)
    end
  end

  def maximizing_player?(current_token, token) do
    token == current_token
  end

  def computer_player_win?(board, token) do
    current_player_token(board) != token
  end
end