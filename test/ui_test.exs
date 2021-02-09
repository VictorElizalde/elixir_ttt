defmodule UiTest do
    use ExUnit.Case, async: true
    import Ui
    import ExUnit.CaptureIO

    test "prints board" do
        assert capture_io(fn ->
            print_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
        end) == "| 1 | 2 | 3 | \n| 4 | 5 | 6 | \n| 7 | 8 | 9 | \n"
    end
end