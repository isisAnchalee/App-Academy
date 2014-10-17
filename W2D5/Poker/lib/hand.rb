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
    if @hand_strength > other_hand.hand_strength
      return true
    elsif @hand_strength == other_hand.hand_strength
      return Card::POKER_VALUE[@high_card] > Card::POKER_VALUE[other_hand.high_card]
    else
      return false
    end
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
      if sort_hand[idx + 1].poker_value - sort_hand[idx].poker_value != 1
        @high_card = sort_hand.last
        return true
      end
    end
    
    false
  end
  
  def flush?
    if @cards.all? { |card| card.suit == cards.first.suit }
      @high_card = sort_hand.last
      return true
    end
    false
  end
  
  def royal_flush?
    straight_flush? && sort_hand.last.poker_value == 14
  end
  
  def four_of_a_kind?
    card_counts = Hash.new(0)
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    card_counts.each_pair do |key, val|
      if val == 4
        @high_card = key
        return true
      end
    end
    false
  end
  
  def three_of_a_kind?
    card_counts = Hash.new(0)
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    card_counts.each_pair do |key, val|
      if val == 3
        @high_card = key
        return true
      end
    end
    false
  end
  
  def one_pair?
    card_counts = Hash.new(0)
    repeats = 0
    
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    
    card_counts.each_pair do |key, val|
      if val == 2
        repeats += 1
        @high_card = key
        return true if repeats == 1
      end
    end
    false
  end
  
  def two_pair?
    pair_count, pairs = 0, []
    card_counts = Hash.new(0)
    
    @cards.each do |card|
      card_counts[card.value] += 1
    end
    
    card_counts.each_pair do |k, v|
      pair_count += 1 if v == 2
      pairs << k
    end
    
    if pair_count == 2
      pairs.each do |pair|
        pair = Card::POKER_VALUE[pair]
      end
      @high_card = pairs.sort.last
      return true
    end
    false
  end
  
  def full_house?
     one_pair? && three_of_a_kind?
  end
  
  def high_card
    sort_hand.last
  end
  
end