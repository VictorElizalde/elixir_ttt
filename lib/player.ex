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

    def create_player(marker, type) do
        case type do
        @human_player ->
            create_human_player(marker)
        @computer_player ->
            create_computer_player(marker)
        end
    end

    def create_human_player(marker) do
        %HumanPlayer{marker: marker}
    end

    def create_computer_player(marker) do
        %ComputerPlayer{marker: marker}
    end
end