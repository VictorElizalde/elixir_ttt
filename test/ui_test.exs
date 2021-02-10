defmodule UiTest do
    use ExUnit.Case, async: true
    import Ui
    import Player
    import ExUnit.CaptureIO

    @human  create_player("X", "human")
    @computer create_player("O", "computer")

    test "prints 3x3 board" do
        assert capture_io(fn ->
            print_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
        end) == "| 1 | 2 | 3 |\n| 4 | 5 | 6 |\n| 7 | 8 | 9 |\n"
    end

    test "prints user instructions to make a move" do
        assert capture_io(fn ->
          print_player_instructions(@human.player_instruction)
        end) == "Select a position between 1 and 9\n" 
    end

    test "prints computer instructions to make a move" do
        assert capture_io(fn ->
          print_player_instructions(@computer.player_instruction)
        end) == "Computer's turn" 
    end

    # test "prints invalid move" do
    #     assert capture_io(fn ->
    #       print_invalid_move()
    #     end) == "Invalid move, try again\n"
    # end

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
end