defmodule BoardTest do
    use ExUnit.Case, async: true
    import Board

    @board [1, 2, 3, 4, 5, 6, 7, 8, 9]

    test "creates a board" do
        board = new_board
        assert board == @board 
    end
end