require 'hand'
require 'card'

RSpec.describe Hand do
  subject(:new_hand) { Hand.new([
          Card.new('spades', :three),
          Card.new('spades', :four),
          Card.new('spades', :five),
          Card.new('spades', :six),
          Card.new('spades', :seven)
        ]) }
  
  context 'a new hand' do
    describe '::deal_from' do
      it 'returns a new hand of 5 cards' do
        deck_cards = [
          Card.new('spades', :ten),
          Card.new('hearts', :five),
          Card.new('diamonds', :three),
          Card.new('clubs', :seven),
          Card.new('hearts', :queen)
        ]
        
        deck = double("deck")
        deck.should_receive(:take).with(5).and_return(deck_cards)
        hand = Hand.deal_from(deck)
        hand.cards.should =~ deck_cards
      end
    end
    
    describe "#straight flush" do
      it 'returns truthy/falsey if hand has straight flush' do
        expect(new_hand.straight_flush?).to be_truthy
      end
    end
    
    describe "#straight?" do
      it 'returns truthy/falsy if a hand has a straight' do
        expect(new_hand.straight?).to be_truthy
      end
    end
    
    describe "#flush?" do
      it 'returns truthy/falsey if hand has a flush' do
        expect(new_hand.flush?).to be_truthy
      end
    end
    
    describe "#royal_flush" do
      it 'returns truthy/falsey if hand has royal flush' do
        new_hand = Hand.new([Card.new('spades', :ten),
          Card.new('spades', :jack),
          Card.new('spades', :queen),
          Card.new('spades', :king),
          Card.new('spades', :ace)])
        expect(new_hand.royal_flush?).to be_truthy
      end
    end
    
    describe "#four_of_a_kind" do
      new_hand = Hand.new([
        Card.new('spades', :five),
        Card.new('hearts', :five),
        Card.new('diamonds', :five),
        Card.new('clubs', :five),
        Card.new('hearts', :queen)])
      it 'returns truthy/falsey if hand has four of a kind' do
          expect(new_hand.four_of_a_kind?).to be_truthy
      end
    end
   
    describe "#three_of_a_kind" do
      new_hand = Hand.new([
        Card.new('spades', :five),
        Card.new('hearts', :five),
        Card.new('diamonds', :five),
        Card.new('clubs', :six),
        Card.new('hearts', :queen)])
      it 'returns truthy/falsey if hand has four of a kind' do
          expect(new_hand.three_of_a_kind?).to be_truthy
      end
    end
    
    describe "#one_pair?" do
      it 'returns truthy/falsey if hand contains one pair' do
        new_hand = Hand.new([
          Card.new('spades', :five),
          Card.new('hearts', :five),
          Card.new('diamonds', :three),
          Card.new('clubs', :six),
          Card.new('hearts', :queen)])
        expect(new_hand.one_pair?).to be_truthy
      end
    end
    
    describe "#two_pair?" do
      new_hand = Hand.new([
        Card.new('spades', :five),
        Card.new('hearts', :five),
        Card.new('diamonds', :three),
        Card.new('clubs', :three),
        Card.new('hearts', :queen)])
      it 'returns truthy/falsey if hand contains two pairs' do
          expect(new_hand.two_pair?).to be_truthy
        end
      end
  
    describe "#full_house?" do
      new_hand = Hand.new([
        Card.new('spades', :five),
        Card.new('hearts', :five),
        Card.new('diamonds', :three),
        Card.new('clubs', :three),
        Card.new('hearts', :three)])
      it 'returns truthy/falsey if hand contains a full house' do
        expect(new_hand.full_house?).to be_truthy
      end
    end
    
    describe "calculate_hand" do
      it 'calculates the value of a hand' do
        expect(new_hand.calculate_hand).to eq(7)
      end 
    end
    
  end
end