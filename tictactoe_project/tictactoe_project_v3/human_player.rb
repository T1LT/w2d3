class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "Enter a position:"
        pos = gets.chomp
        pos = pos.split(" ").map!(&:to_i)
        p pos
        while !legal_positions.include? pos
            puts "invalid position!"
            puts "Enter a new position:"
            pos = gets.chomp
            pos = pos.split(" ").map!(&:to_i)
            p pos
        end
        pos
    end
end