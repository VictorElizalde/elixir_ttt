defmodule Player do
  @human_player "human"
  @computer_player "computer"

  defprotocol(PlayerInstruction, do: def(get_instruction(player)))

  defimpl PlayerInstruction, for: HumanPlayer do
    def get_instruction(_human_player) do
      "Select a position between 1 and 9"
    end
  end

  defimpl PlayerInstruction, for: ComputerPlayer do
    def get_instruction(_computer_player) do
      "Computer's turn"
    end
  end

  defprotocol PlayerInvalid do
    @fallback_to_any true
    def get_invalid_instruction(player)
  end

  defimpl PlayerInvalid, for: Any do
    def get_invalid_instruction(_) do
      "Invalid move, try again"
    end
  end

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