defmodule Player do
  @human_player "human"
  @computer_player "computer"

  def create_player(token, type) do
    case type do
    @human_player ->
      create_human_player(token)
    @computer_player ->
      create_computer_player(token)
    end
  end

  def create_human_player(token) do
    %HumanPlayer{token: token}
  end

  def create_computer_player(token) do
    %ComputerPlayer{token: token}
  end

  def player_types do
    [@human_player, @computer_player]
  end
end