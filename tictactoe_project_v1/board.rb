class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def valid?(pos)
        if pos[0] < 0 || pos[0] > 2 || pos[1] < 0 || pos[1] > 2
            return false
        end
        true
    end

    def empty?(pos)
        return true if self[pos] == '_'
        false
    end

    def place_mark(pos, mark)
        if !self.valid?(pos)
            raise "invalid position"
        elsif !self.empty?(pos)
            raise "position is not empty"
        else
            self[pos] = mark
        end
    end

    def print_grid
        (0...@grid.length).each do |i|
            (0...@grid[0].length).each do |j|
                print self[[i, j]]
                j != @grid[0].length - 1 && print(" ")
            end
            puts ""
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.uniq == [mark] }
    end

    def win_column?(mark)
        @grid.transpose.any? { |column| column.uniq == [mark] }
    end

    def win_diagonal?(mark)
        flag = true
        (0...@grid.length).each do |i|
            if self[[i, i]] != mark
                flag = false
            end
        end
        return true if flag == true
        (0...@grid[0].length).each do |i|
            if self[[i, @grid.length - i - 1]] != mark
                return false
            end
        end
        true
    end

    def win?(mark)
        win_row?(mark) || win_column?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? { |spot| spot == '_' }
    end
end