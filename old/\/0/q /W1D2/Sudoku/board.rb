require_relative "tile"

class Board
  SOLVED = (1..9).to_a

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(filename)
    arr = []
    File.foreach(filename) do |line|
      arr << line.chomp.split("").map {|num| num.to_i}
    end

    self.new(arr)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def render
    @grid.each do |row|
      puts "-----------------------------------"
      row_to_s = ""
      row.each do |square|
        row_to_s += "#{square.to_s} | "
      end
      puts row_to_s
    end
    puts "-----------------------------------"
  end

  def solved?
    row_solved? && col_solved? && block_solved?
  end

  def row_solved?
    @grid.all? { |row| row.sort == SOLVED }
  end

  def col_solved?
    @grid.transpose.all? { |col| col.sort == SOLVED }
  end

  def block_solved?
    get_blocks.all? { |block| block.sort == SOLVED }
  end

  def get_blocks
    blocks = []
    @grid.each_slice(3) do |thirds|
      thirds.transpose.each_slice(3) do |block|
        blocks << block.flatten
      end
    end
    blocks
  end
end
