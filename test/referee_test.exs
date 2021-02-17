defmodule RefereeTest do
  use ExUnit.Case, async: true
  import Referee

  @board [1, 2, 3, 4, 5, 6, 7, 8, 9]

  test "returns true because no more moves available" do
    board = ["O", "X", "X", 
             "X", "X", "O", 
             "O", "O", "X"]

    assert board_full?(board)
  end

  test "returns true board is empty" do
    board = @board 
    assert empty_board?(board)
  end

  test "horizontal winner" do
    board = ["X", "X", "X", 
             4, 5, 6, 
             7, 8, 9]

    assert game_over?(board)
    assert winning_game?(board)
  end

  test "vertical winner" do
    board = ["X", 2, 3, 
             "X", 5, 6, 
             "X", 8, 9]

    assert game_over?(board)
    assert winning_game?(board)
  end

  test "diagonal winner" do
    board = ["X", 2, 3, 
             4, "X", 6, 
             7, 8, "X"]

    assert game_over?(board)
    assert winning_game?(board)
  end

  test "game over and no winner returns tie" do
    board = ["X", "O", "X", 
             "X", "O", "O", 
             "O", "X", "X"]
    assert tie?(board)
  end

  test "game is not over" do
    board = ["X", "X", "O", 
             4, 5, 6, 
             7, 8, 9]
    refute game_over?(board)
  end
end