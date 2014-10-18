require_relative 'hand'

class Player
  
  attr_reader :name, :bankroll, :hand, :bet_amt
  
  def initialize(name, bankroll, hand = Hand.new)
    @name = name
    @bankroll = bankroll
    @hand = hand
    @bet_amt = 0
  end
  
  def ask_user
    puts "Would you like to discard any cards?(y/n)"
    input = gets.chomp
    if input == "y".downcase
      puts "What cards would you like to discard?(index value)"
      input2 = gets.chomp
      discard_val = parse_user_input(input2)
    end
    
    puts "Would you like to fold, see or raise?"
    input3 = gets.chomp
    case input3
      when "fold"
        fold
      when "see"
        see
      when "raise"
        raise_bet
      end
  end
  
  def discard_cards(discard_places)
    discard_places.each do |place|
      @hand[place] = @deck.take(1)
    end
    return true
  end
  
  def fold
    @hand = []
    @bankroll -= @bet_amt
  end
  
  def pay_winnings(amt)
    @bankroll += amt
  end
  
  def see(game, remaining_amt)
    raise_bet(game, remaining_amt)
  end
  
  def raise_bet(game, bet_amt)
    raise "player can't cover bet" if bet_amt > @bankroll
    @bet_amt = bet_amt
    game.take_bet(self, bet_amt)
  end
  
end