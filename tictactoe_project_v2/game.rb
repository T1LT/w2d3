require_relative "./human_player.rb"
require_relative "./board.rb"

class Game
    def initialize(size, *pmarks)
        @pmarks = pmarks.map { |pmark| HumanPlayer.new(pmark) }
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
            @board.place_mark(@current.get_position, @current.mark)
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

g = Game.new(4, :a, :b, :c)
g.play