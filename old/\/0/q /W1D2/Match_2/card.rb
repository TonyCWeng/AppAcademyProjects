class Card
  attr_reader :card_value
  attr_accessor :face_up

  def initialize(card_value, face_up = false)
    @card_value = card_value
    @face_up = face_up
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_up ? @card_value : "*" 
  end

  def ==(other_card)
    self.card_value == other_card.card_value
  end
end
