defmodule Ui do
    import Board, only: [get_row: 3, get_rows_num: 1, row_counter: 1]

    def print_board(board) do
        num_rows = get_rows_num(board)
        row_counter(num_rows) |> Enum.each(fn index -> 
          print_row(board, num_rows, index)
        end)
    end

    def print_row(board, num_rows, index) do
        first = index * num_rows
        last =  num_rows * (index + 1) - 1
        print_line row_to_string(board, first, last)
    end

    def print_line(text) do
        IO.puts text 
    end

    def row_to_string(board, first, last) do
        get_row(board, first, last) |> add_cell_dividers
    end

    def add_cell_dividers(row) do
        row_string = Enum.map(row, fn(n) -> 
            " " <> to_string(n) <> " |"
        end)
        |> Enum.join("")
        "|" <> row_string
    end

    def print_user_instructions do
        print_line "Select a position between 1 and 9"
    end

    def print_invalid_move do
        print_line "Invalid move, try again"
    end

    def print_tie do
        print_line "Tie!"
    end

    def print_winner(winner_token) do
        print_line "Winner is #{winner_token}!"
    end

    def print_computer_turn do
        print_line "Computer's turn"
    end
end