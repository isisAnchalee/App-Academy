require_relative 'card'

class Deck
  
  attr_reader :cards
  
  def self.all_cards
    all_cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(suit, value)
      end
    end
    all_cards
  end
  
  def initialize( cards = Deck.all_cards )
    @cards = cards
  end
  
  def count
    @cards.count
  end
  
  def take(n)
    @cards.shift(n)
  end
  
  def return(card)
    @cards << card
  end

end
