defmodule Player do
    @human_player "human"
    @computer_player "computer"

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