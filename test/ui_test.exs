defmodule UiTest do
    use ExUnit.Case, async: true
    import Ui
    import ExUnit.CaptureIO

    test "prints 3x3 board" do
        assert capture_io(fn ->
            print_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
        end) == "| 1 | 2 | 3 |\n| 4 | 5 | 6 |\n| 7 | 8 | 9 |\n"
    end

    test "prints user instructions to make a move" do
        assert capture_io(fn ->
          print_user_instructions()
        end) == "Select a position between 1 and 9\n" 
    end

    test "prints invalid move" do
        assert capture_io(fn ->
          print_invalid_move()
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

    test "prints computer turn" do
        assert capture_io(fn ->
          print_computer_turn()
        end) == "Computer's turn\n"
    end
end