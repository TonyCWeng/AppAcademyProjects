require_relative "card"

class Board
  CARDS = ("A".."Z").to_a

  attr_reader :grid

  def self.create_grid
    Array.new(4) {Array.new(5)}
  end

  def initialize (grid = Board.create_grid)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def randomize_set
    random_cards = CARDS.sample(@grid.flatten.length / 2) * 2
    random_cards.shuffle.map do |value|
      Card.new(value)
    end
  end

  def populate
    card_array = randomize_set

    @grid.each_with_index do |row, row_index|
      row.each_index do |col_index|
        pos = [row_index, col_index]
        self[pos] = card_array.pop
      end
    end
  end

  def render
    @grid.each do |row|
      row_to_s = ""
      row.each do |card|
        row_to_s += card.to_s + " "
      end
      puts row_to_s
    end
  end

  def won?
    @grid.flatten.all? { |card| card.face_up }
  end

  def reveal(card)
    if card.face_up
      return
    else
      card.reveal
      card.card_value
    end
  end
end
