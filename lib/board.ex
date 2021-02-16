defmodule Board do
  def new_board(rows) do
    Range.new(1, (rows * rows)) |> Enum.to_list
  end

  def set_token_at(board, position_index, token) do
    List.replace_at(board, position_index - 1, token)
  end

  def rows(board) do
    num_rows = get_rows_num(board)
    count = row_counter(num_rows)
    Enum.map count, fn(i) -> 
      get_row(board, (i * num_rows), ((i + 1) * num_rows) - 1)
    end
  end

  def columns(board) do
    num_rows = get_rows_num(board)
    count = row_counter(num_rows)
    Enum.map count, fn(index) -> 
      get_column(board, index, count, num_rows)
    end
  end

  def diagonals(board) do
    num_rows = get_rows_num(board)
    count = row_counter(num_rows)
    [get_diagonal(board, List.first(count), (num_rows + 1), count),
    get_diagonal(board, List.last(count), (num_rows - 1), count)]
  end

  def get_row(board, first, last) do
    range = Range.new(first, last)
    Enum.slice(board, range)
  end

  def get_column(board, index, count, num_rows) do
    Enum.map(count, fn(n) -> (get_position_value(board, (index + (n * num_rows)))) end)
  end

  def get_diagonal(board, index, step_value, count) do
    if index == 0 do
      Enum.map(count, fn(n) -> (get_position_value(board, (index + n) * step_value)) end)
    else
      Enum.map(count, fn(n) -> (get_position_value(board, index + (n * step_value))) end)
    end
  end

  def get_rows_num(board) do
    Enum.count(board) |> :math.sqrt |> round
  end

  def row_counter(num_rows) do
    Range.new(0, num_rows - 1) |> Enum.to_list
  end

  def get_position_value(board, index) do
    Enum.at(board, index)
  end

  def available_position?(board, position_index) do
    Enum.at(board, position_index) |> is_integer
  end
end