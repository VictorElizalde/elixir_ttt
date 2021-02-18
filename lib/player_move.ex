import Ui, only: [get_input: 0]
import Validator, only: [validate_move: 3]
import ComputerPlayer, only: [computer_move: 2]

defprotocol PlayerMove do
  @only [HumanPlayer, ComputerPlayer]
  def make_move(player, board)
end

defimpl PlayerMove, for: HumanPlayer do
  def make_move(player, board) do
    move = get_input()
    validate_move(board, move, player)
  end
end

defimpl PlayerMove, for: ComputerPlayer do
  def make_move(player, board) do
    computer_move(board, player.token)
  end
end
