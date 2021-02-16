defmodule GameTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  import Game 
  
  @player_x %HumanPlayer{token: "X"}
  @player_o %ComputerPlayer{token: "O"}

  test "returns player with X token" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert current_player(board, @player_x, @player_o) == @player_x
  end
  
  test "returns player with O token" do
    board = ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    assert current_player(board, @player_x, @player_o) == @player_o
  end

  test "prints tie game message for tie board" do
     board = ["X", "O", "X", "X", "O", "O", "O", "X", "X"]
     assert capture_io(fn ->
       game_over_message(board)
     end) == "| X | O | X |\n| X | O | O |\n| O | X | X |\nTie!\n"
  end

  test "prints winning game message for X" do
     board = ["X", "O", 3,
              "X", "O", "O",
              "X", "X", 9]
     assert capture_io(fn ->
       game_over_message(board)
     end) == "| X | O | 3 |\n| X | O | O |\n| X | X | 9 |\nWinner is X!\n"
  end

  test "prints winning game message for O" do
     board = ["O", "O", 3,
              "X", "O", "X",
              "X", "X", "O"]
     assert capture_io(fn ->
       run_turns(board, @player_x, @player_o)
     end) == "| O | O | 3 |\n| X | O | X |\n| X | X | O |\nWinner is O!\n"
  end
end
