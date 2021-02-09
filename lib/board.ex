defmodule Board do
    def new_board do
        Range.new(1, 9) |> Enum.to_list
    end
end