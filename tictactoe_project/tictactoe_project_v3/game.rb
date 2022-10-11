require_relative "./human_player.rb"
require_relative "./computer_player.rb"
require_relative "./board.rb"

class Game
    def initialize(size, marks_hash)
        @pmarks = []
        marks_hash.map do |player, is_comp|
            @pmarks.push(is_comp ? ComputerPlayer.new(player) : HumanPlayer.new(player))
        end
        @current = @pmarks[0]
        @size = size
        @board = Board.new(@size)
    end

    def switch_turn
        @pmarks.rotate!
        @current = @pmarks[0]
    end

    def play
        while @board.empty_positions?
            @board.print_grid
            @board.place_mark(@current.get_position(@board.legal_positions), @current.mark)
            if @board.win?(@current.mark)
                puts "VICTORY"
                @board.print_grid
                return
            end
            switch_turn
        end
        puts "DRAW"
        @board.print_grid
    end
end

machine_civil_war = Game.new(10, h: true, u: true, e: true)
machine_civil_war.play