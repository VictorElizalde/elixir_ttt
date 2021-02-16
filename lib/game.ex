defmodule Game do
  import Board, only: [new_board: 1]
  import Referee, only: [game_over?: 1, winning_game?: 1]
  import Player, only: [create_player: 2]
  import Integer, only: [is_even: 1]
  import Ui
  import PlayerMove

  def play_game do
    board = new_board(3)
    player_x = create_player("X", "human")
    player_o = create_player("O", "computer")
    run_turns(board, player_x, player_o)
  end

  def run_turns(board, player_x, player_o) do
    if game_over?(board) do
      game_over_message(board)
    else
      get_next_move(board, player_x, player_o) |> run_turns(player_x, player_o)
    end
  end
  
  def get_next_move(board, player_x, player_o) do
    print_player_instructions(PlayerInstruction.get_instruction(current_player(board, player_x, player_o)))
    print_board(board)
    current_player(board, player_x, player_o) |> make_move(board)
  end

  def current_player(board, player_x, player_o) do
    if player_x_turn?(board), do: player_x, else: player_o
  end

  def game_over_message(board) do
    print_board(board)
    if winning_game?(board) do
      winning_token(board) |> print_winner
    else
      print_tie()
    end
  end

  def current_player_token(board) do
    if player_x_turn?(board), do: "X", else: "O"
  end

  def winning_token(board) do
    if player_x_turn?(board), do: "O", else: "X"
  end

  def player_x_turn?(board) do
    Enum.filter(board, fn(position) -> has_token?(position) end) |> length |> is_even
  end

  def has_token?(position) do
    !is_integer(position)
  end
end
