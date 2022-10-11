require_relative "./human_player.rb"
require_relative "./board.rb"

class Game
    def initialize(p1mark, p2mark)
        @p1 = HumanPlayer.new(p1mark)
        @p2 = HumanPlayer.new(p2mark)
        @current = @p1
        @board = Board.new
    end

    def switch_turn
        @current == @p1 ? @current = @p2 : @current = @p1
    end

    def play
        while @board.empty_positions?
            @board.print_grid
            @board.place_mark(@current.get_position, @current.mark)
            if @board.win?(@current.mark)
                puts "VICTORY"
                return
            end
            switch_turn
        end
        puts "DRAW"
    end
end

g = Game.new(:X, :O)
g.play