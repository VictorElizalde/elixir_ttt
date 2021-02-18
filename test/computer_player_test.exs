defmodule ComputerPlayerTest do
  use ExUnit.Case, async: true
  import ComputerPlayer 

  test "returns win score on win board" do
     board = ["X", "X", "X", "O", "O", 6, 7, 8, 9]
     assert score(board, "X") == 20
  end

  test "returns tie score on tie board" do
     board = ["X", "X", 3, "O", "O", 6, 7, 8, 9]
     assert score(board, "X") == 0
  end

  test "returns lose score on lose board" do
     board = ["X", "X", 3, "O", "O", "O", 7, 8, "X"]
     assert score(board, "X") == -20
  end

  test "takes winning move" do
    board = [1, "X", "X", 
             "X", "O", "O", 
             "X", "O", "O"]
    assert computer_move(board, "X") == ["X", "X", "X", "X", "O", "O", "X", "O", "O"] 
  end

  test "takes winning space when available" do
    board = [1, "X", "X", 
              4, "O", "O", 
               7, 8, 9]
    assert optimal_move(board, "X") == 0
  end

  test "takes winning row space when available" do
    board = [1, "X", "X", 
              4, "O", "O", 
               7, 8, 9]
    assert optimal_move(board, "X") == 0
  end

  test "takes winning diagonal space when available" do
    board = [1, "O", "X", 
              4, "X", "O", 
               7, 8, 9]
    assert optimal_move(board, "X") == 6
  end

  test "blocks opponent win" do
    board = [1, "X", "X", 
             "X", "O", "O", 
             "O", "X", 9]
    assert optimal_move(board, "O") == 0
  end

  test "chooses win over block" do
    board = [1, "X", "X", 
             4, "O", "O", 
             "O", "X", "X"]
    assert optimal_move(board, "O") == 3
  end

  test "chooses win over block or non-win" do
    board = [1, "O", "O", 
             4, "X", "X", 
             "X", 8, "O"]
    assert optimal_move(board, "X") == 3
  end

  test "chooses block" do
    board = [1, "O", "O", 
             4, 5, "X", 
             "X", 8, 9]
    assert optimal_move(board, "X") == 0
  end

  test "chooses center " do
    board = ["X", 2, 3, 
             4, 5, 6, 
             7, 8, 9]
    assert optimal_move(board, "O") == 4
  end

  test "chooses win when same position is block and win" do
    board = [1, "X", "X", 
             4, "O", 6, 
             7, "X", "O"]
    assert optimal_move(board, "O") == 0
  end

  test "chooses center position for the win" do
    board = ["O", "X", "X", 
              4, 5, 6, 
              7, "X", "O"]
    assert optimal_move(board, "O") == 4
  end

  test "chooses future block" do
    board = ["X", 2, "O", 
              "O", 5, 6, 
              "X", 8, 9]
    assert optimal_move(board, "X") == 8
  end

  test "chooses center for the win" do
    board = ["X", 2, "O", 
              "O", 5, 6, 
              "X", "O", "X"]
    assert optimal_move(board, "X") == 4
  end

  test "takes the win on row" do
    board = ["X", 2, "O", 
              "O", "O", 6, 
              "X", 8, "X"]
    assert optimal_move(board, "X") == 7
  end

end
