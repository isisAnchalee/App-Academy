class Game
  
  attr_accessor :current_turn, :deck, :pot
  
  def initialize()
    @deck = Deck.new
    @player_1 = Player.new("Isis", 100_000_000)
    @player_2 = Player.new("David", 375)
    @current_turn = @player_1
    @pot = 0
  end
  
  def take_bet(player, bet_amt)
    @pot += bet_amt
  end
  
  def switch_player
    @current_turn = @current_turn == @player_1 ? @player_2 : @player_1
  end
  
  
  
end