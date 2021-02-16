defmodule Validators do
  import Ui
  import Board, only: [available_position?: 2, set_token_at: 3]

  defprotocol(PlayerInstruction, do: def(get_instruction(player)))

  defimpl PlayerInstruction, for: HumanPlayer do
    def get_instruction(_human_player) do
      "Select a position between 1 and 9"
    end
  end

  defimpl PlayerInstruction, for: ComputerPlayer do
    def get_instruction(_computer_player) do
      "Computer's turn"
    end
  end

  defprotocol PlayerInvalid do
    @fallback_to_any true
    def get_invalid_instruction(player)
  end

  defimpl PlayerInvalid, for: Any do
    def get_invalid_instruction(_) do
      "Invalid move, try again"
    end
  end

  def validate_move(board, position, token, player) do
    if valid_move?(board, position) do
      play_valid_move(board, position, token)
    else
      handle_invalid_move(player)
      board
    end
  end

  def play_valid_move(board, position, token) do
    position_index = get_position_index(position)
    set_token_at(board, position_index, token) 
  end

  def handle_invalid_move(player) do
    print_invalid_player_move(PlayerInvalid.get_invalid_instruction(player))
    print_player_instructions(PlayerInstruction.get_instruction(player))
  end

  def get_move(board, token, player) do
    print_player_instructions(PlayerInstruction.get_instruction(player))
    position = get_input()
    validate_move(board, position, token, player)
  end

  def within_range?(board, position_index) do
    (position_index >= 1) && (position_index < (length board))
  end

  def valid_position_index?(board, position_index) do
    within_range?(board, position_index) && available_position?(board, position_index)
  end

  def valid_move?(board, position) do
    valid_integer?(position) && valid_position_index?(board, get_position_index(position))
  end

  def valid_integer?(position) do
    try do
      is_tuple(Integer.parse(position))
    rescue
      e in RuntimeError -> e
    end
  end

  def get_position_index(position) do
    parse_integer(position)
  end

  def parse_integer(string) do
    elem(Integer.parse(string), 0)
  end
end
