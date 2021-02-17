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