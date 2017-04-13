require 'colorize'

class Tile
  attr_reader :value, :given

  def initialize(value)
    @value = value
    value == 0 ? @given = false : @given = true
  end

  def to_s
    @given ? @value.to_s.colorize(:red) : @value.to_s
  end
end
