defmodule Board do
    def new_board(rows) do
        Range.new(1, (rows * rows)) |> Enum.to_list
    end

    def get_row(board, first, last) do
        range = Range.new(first, last)
        Enum.slice(board, range)
    end

    def get_rows_num(board) do
        Enum.count(board) |> :math.sqrt |> round
    end

    def row_counter(num_rows) do
        Range.new(0, num_rows - 1) |> Enum.to_list
    end
end