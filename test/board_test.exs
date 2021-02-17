defmodule BoardTest do
  use ExUnit.Case, async: true
  import Board

  @board [1, 2, 3, 4, 5, 6, 7, 8, 9]

  test "creates a board" do
    board = new_board(3)
    assert board == @board
  end

  test "lists all rows" do
    board = @board 
    assert rows(board) == [[1, 2, 3], [4, 5, 6], [7, 8, 9]] 
  end

  test "lists all columns" do
    board = @board
    assert columns(board) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]] 
  end

  test "lists diagonals" do
    board = @board 
    assert diagonals(board) == [[1, 5, 9], [3, 5, 7]] 
  end

  test "adds token to the board" do
    board = @board
    assert set_token_at(board, 1, "X") == ["X", 2, 3, 
                                            4, 5, 6, 
                                            7, 8, 9]
  end

  test "position is not available" do
    board = ["X", 2, 3,
              4, 5, 6,
              7, 8, 9]
    refute available_position?(board, 1)
  end

  test "position is available on max position" do
    board = ["X", 2, 3,
              4, 5, 6,
              7, 8, 9]
    assert available_position?(board, 9)
  end
end