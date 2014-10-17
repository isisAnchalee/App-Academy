class Card
  
  attr_reader :suit, :value, :poker_value
  
  def initialize(suit, value = VALUE_STRINGS[value], poker_value = POKER_VALUE[value])
    @suit = suit
    @value = value
    @poker_value = poker_value
  end
  
  SUIT_STRINGS = {
      :clubs    => 'clubs',
      :diamonds => 'diamonds',
      :hearts   => 'hearts',
      :spades   => 'spades'
    }

    VALUE_STRINGS = {
      :deuce => "2",
      :three => "3",
      :four  => "4",
      :five  => "5",
      :six   => "6",
      :seven => "7",
      :eight => "8",
      :nine  => "9",
      :ten   => "10",
      :jack  => "J",
      :queen => "Q",
      :king  => "K",
      :ace   => "A"
    }

    POKER_VALUE = {
      :deuce => 2,
      :three => 3,
      :four  => 4,
      :five  => 5,
      :six   => 6,
      :seven => 7,
      :eight => 8,
      :nine  => 9,
      :ten   => 10,
      :jack  => 11,
      :queen => 12,
      :king  => 13,
      :ace   => 14
    }
    
    def self.suits
      SUIT_STRINGS.keys
    end
    
    def self.values
      VALUE_STRINGS.keys
    end
    

end
