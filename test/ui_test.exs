defmodule UiTest do
  use ExUnit.Case, async: true
  import Ui
  import Player
  import HumanPlayer
  import ComputerPlayer
  import ExUnit.CaptureIO

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

  @human  create_player("X", "human")
  @computer create_player("O", "computer")

  test "prints 3x3 board" do
    assert capture_io(fn ->
      print_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end) == "| 1 | 2 | 3 |\n| 4 | 5 | 6 |\n| 7 | 8 | 9 |\n"
  end

  test "prints user instructions to make a move" do
    assert capture_io(fn ->
      print_player_instructions(PlayerInstruction.get_instruction(@human))
    end) == "Select a position between 1 and 9\n" 
  end

  test "prints computer instructions to make a move" do
    assert capture_io(fn ->
      print_player_instructions(PlayerInstruction.get_instruction(@computer))
    end) == "Computer's turn\n" 
  end

  test "prints invalid move" do
    assert capture_io(fn ->
      print_invalid_player_move(PlayerInvalid.get_invalid_instruction(@human))
    end) == "Invalid move, try again\n"
  end

  test "prints tie" do
    assert capture_io(fn ->
      print_tie()
    end) == "Tie!\n"
  end

  test "prints winner" do
    assert capture_io(fn ->
      print_winner("X")
    end) == "Winner is X!\n"
  end

  test "returns player move input" do
    capture_io([input: "1\n", capture_prompt: false], fn ->
      input = get_input()
      assert input == "1"
    end)
  end
end