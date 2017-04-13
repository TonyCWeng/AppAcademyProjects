class Game

  attr_accessor :player, :fragment, :dictionary

  def initialize(filename, player1 = "Player 1", player2 = "Player2")
    @dictionary = File.readline(filename)
    @player1 = player1
    @player2 = player2
    @fragment = ""
  end

  def play_round

  end

  private

  def take_turn(player)
    puts " Choose a letter, #{player}."
    
  end

  # def current_player
  #   current_player = @player1
  # end
  #
  # def previous_player
  #   previous_player = @player2
  # end
end
