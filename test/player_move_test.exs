defmodule PlayerMoveTest do
  use ExUnit.Case, async: true
  import PlayerMove
  import ExUnit.CaptureIO

  @board [1, 2, 3, 4, 5, 6, 7, 8, 9]

  test "human player makes move" do
    capture_io([input: "1\n", capture_prompt: false], fn ->
      player = %HumanPlayer{token: "X"}
      assert make_move(player, @board) == ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    end)
  end

  # test "computer player makes move" do
  #   capture_io([input: "1\n", capture_prompt: false], fn ->
  #     player = %ComputerPlayer{token: "O"}
  #     assert make_move(player, @board) == ["O", 2, 3, 4, 5, 6, 7, 8, 9]
  #   end)
  # end
end
