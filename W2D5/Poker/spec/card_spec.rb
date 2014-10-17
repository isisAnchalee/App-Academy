require 'card'

RSpec.describe Card do
  subject(:new_card){ Card.new('clubs',:five) }
  let (:player){ double("player") }
  
  context 'a new card' do
    it 'has a suit' do
      expect(new_card.suit).to eq('clubs')
    end
    it 'has a value' do
      expect(new_card.value).to eq(:five)
    end
  end
  
end