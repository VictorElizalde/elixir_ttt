defmodule PlayGame do
  import Game, only: [play_game: 0]

  def main(_) do
    play_game()
  end
end
