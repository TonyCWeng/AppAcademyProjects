require_relative "board"
require_relative "card"

class Game
  attr_reader :board, :previous_guess

  def initialize(board = Board.new)
    @board = board
    @previous_guess = nil
  end

  def play
    @board.populate

    until over?
      system("clear")
      @board.render
      pos = prompt
      make_guess(pos)
      # @board.render
      sleep(1)
    end

    puts "Game over"
  end

  def over?
    @board.won?
  end

  def prompt
    puts "Guess a position: (i.e. '0,0')"
    pos = gets.chomp.split(',').map(&:to_i)
  end

  def make_guess(pos)
    if @previous_guess.nil?
      @board.reveal(@board[pos])
      @previous_guess = pos
    else second_guess(pos)
    end

  end

  def second_guess(pos)
    @board.reveal(@board[@previous_guess])
    @board.reveal(@board[pos])
    @board.render
    if @board[@previous_guess] != @board[pos]
      (@board[@previous_guess]).hide
      (@board[pos]).hide
    end

    @previous_guess = nil
  end

end
