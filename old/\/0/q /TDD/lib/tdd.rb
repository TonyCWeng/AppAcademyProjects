class TDD
  def my_uniq(arr)
    new_arr = []
    arr.each do |el|
      new_arr << el unless new_arr.include?(el)
    end
    new_arr
  end

end

class Array

  def two_sum
    indicies = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        indicies << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    indicies
  end

  def my_transpose
    arr = Array.new(length) { [] }
    (0...length).each do |i|
      (0...length).each do |j|
        arr[i] << self[j][i]
      end
    end
    arr
  end

  def stock_picker
    biggest = nil
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        if biggest.nil? || self[j] - self[i] > self[biggest[1]] - self[biggest[0]]
          biggest = [i, j]
        end
        j += 1
      end
      i += 1
    end
    biggest
  end

end

class Towers_Of_Hanoi
  attr_accessor :towers
  def initialize
    @towers = [[3,2,1], [], []]
  end

  def move(start_tower, end_tower)
    unless @towers[end_tower].empty?
      raise 'Invalid move' if @towers[end_tower].last < @towers[start_tower].last
    end
    @towers[end_tower] << @towers[start_tower].pop
    @towers
  end

  def won?
    @towers == [[], [3,2,1], []] || @towers == [[], [], [3,2,1]]
  end
end
