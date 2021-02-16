defprotocol PlayerInvalidInstruction do
  @fallback_to_any true
  def get_invalid_instruction(player)
end

defimpl PlayerInvalidInstruction, for: Any do
  def get_invalid_instruction(_) do
    "Invalid move, try again"
  end
end