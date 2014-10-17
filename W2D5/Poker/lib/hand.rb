require_relative 'deck'

class Hand
  
  attr_reader :hand_strength, :high_card
  
  HAND_RANKING =[

    :one_pair?, 
    :two_pair?, 
    :three_of_a_kind?,
    :straight?,
    :flush?,
    :full_house?,
    :four_of_a_kind?,
    :straight_flush?,
    :royal_flush?     
    ]
  
  def self.deal_from(deck)
    Hand.new(deck.take(5))
  end
  
  attr_accessor :cards
  
  def initialize(cards)
    @cards = cards
    @hand_strength = nil
    @high_card = 0
 
  end
  
  def beats?(other_hand)    
    @hand_strength > other_hand.hand_strength
    
  end
  
  def calculate_hand
    HAND_RANKING.reverse.each do |hand|
      @hand_strength = HAND_RANKING.find_index(hand) if hand 
      return @hand_strength
    end
    @high_card = high_card
  end
  
  def sort_hand
    @cards.sort_by { |card| card.poker_value }
  end
  
  def straight_flush?
    straight? && flush?
  end
  
  def straight?
    (0...4).each do |idx|
      return false if sort_hand[idx + 1].poker_value - sort_hand[idx].poker_value != 1
    end
    
    true
  end
  
  def flush?
    @cards.all? { |card| card.suit == cards.first.suit }
  end
  
  def royal_flush?
    straight_flush? && sort_hand.last.poker_value == 14
  end
  
  def four_of_a_kind?
    card_counts = Hash.new(0)
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    card_counts.values.any? { |val| val == 4 }
  end
  
  def three_of_a_kind?
    card_counts = Hash.new(0)
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    card_counts.values.any? { |val| val == 3 }
  end
  
  def one_pair?
    card_counts = Hash.new(0)
    
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    card_counts.values.one? { |val| val == 2 }
  end
  
  def two_pair?
    pairs = 0
    card_counts = Hash.new(0)
    
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    
    card_counts.each_pair do |k, v|
      pairs += 1 if v == 2
    end
    
    pairs == 2
  end
  
  def full_house?
    three_of_a_kind? && one_pair?
  end
  
  def high_card
    sort_hand.last
  end
  
end