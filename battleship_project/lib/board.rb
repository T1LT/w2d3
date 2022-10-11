class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        (0...@grid.length).each do |i|
            (0...@grid[0].length).each do |j|
                count += 1 if @grid[i][j] == :S
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H 
            puts "you sunk my battleship!"
            return true
        end
        self[pos] = :X
        return false
    end

    def place_random_ships
        perm = (0...Math.sqrt(@size).to_i).to_a.permutation(2).to_a
        (@size / 4).times do
            self[perm.pop] = :S
        end
    end

    def hidden_ships_grid
        n = Math.sqrt(@size).to_i
        res = Array.new(n) { Array.new(n, :N) }
        (0...@grid.length).each do |i|
            (0...@grid[0].length).each do |j|
                pos = [i, j]
                if self[pos] != :S
                    res[i][j] = self[pos]
                end
            end
        end
        res
    end

    def self.print_grid(grid)
        (0...grid.length).each do |i|
            (0...grid[0].length).each do |j|
                print grid[i][j].to_s
                j != grid[0].length - 1 && print(" ")
            end
            puts ""
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
