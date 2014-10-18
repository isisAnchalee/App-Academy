require 'card'
require 'deck'


RSpec.describe Deck do
  subject(:deck){ Deck.new }
  
  context 'a new deck' do
    it 'would have 52 cards' do
      expect(deck.cards.count).to eq(52)
    end
  end
  
  context 'a deck in play' do
    play_deck = Deck.new([Card.new('clubs', :five), Card.new('diamonds', :deuce)])
    it 'returns the number of cards in deck' do 
      expect(play_deck.count).to eq(2)
    end
    
    describe '#take' do
      it 'takes n cards from the top of the deck' do
        expect(deck.take(2).count).to eq(2)
      end
    end
    
    describe '#return' do 
      it 'returns n cards to the end of the deck' do
        play_deck = Deck.new([Card.new('clubs', :five), Card.new('diamonds', :deuce)])
        play_deck.return(Card.new('hearts',:deuce))
        expect(play_deck.count).to eq(3)
      end
    end
  end
end