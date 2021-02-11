defmodule PlayerTest do
  use ExUnit.Case, async: true
  import Player

  test "creates a human player" do
    player = create_player("X", "human") 
  
    assert player.__struct__ == HumanPlayer
    assert player.token == "X"
  end

  test "creates a computer player" do
    player = create_player("O", "computer") 

    assert player.__struct__ == ComputerPlayer
    assert player.token == "O"
  end
end