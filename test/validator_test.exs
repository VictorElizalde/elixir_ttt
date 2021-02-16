defmodule ValidatorsTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  import Validator 
  import Player
  import HumanPlayer

  @board [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @player  create_player("X", "human")

  test "move is valid" do
    board = @board
    assert valid_move?(board, "1")
  end

  test "move is invalid for letter input" do
    refute valid_move?(@board, "G")
  end

  test "move is invalid for symbol input" do
    refute valid_move?(@board, "/")
  end

  test "move is invalid when position is occupied" do
    refute valid_move?(@board, "0")
  end

  test "returns true for position within range" do
    board = @board
    assert valid_move?(board, "1")
  end

  test "returns true for moves inside of the range" do
    assert within_range?(@board, 9)
  end

  test "returns false for moves outside of the range" do
    refute within_range?(@board, 16)
  end

  test "prints invalid move message for bad move input" do
    assert capture_io(fn ->
      validate_move(["X", 2, 3, 4, 5, 6, 7, 8, 9], "asdf", @player)
    end) == "Invalid move, try again\n" 
  end

  test "adds move to board when valid" do
    board = @board 
    assert validate_move(board, "1", @player) == ["X", 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
