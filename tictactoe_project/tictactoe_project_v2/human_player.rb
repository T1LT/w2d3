class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Enter a position:"
        pos = gets.chomp
        pos.split(" ").map!(&:to_i)
    end
end