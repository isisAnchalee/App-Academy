require 'player'

describe Player do
  subject(:player) { Player.new("Nick the Greek", 200_000) }
  
  describe "name" do
    it 'should == Nick the Greek' do
    expect(player.name).to eq("Nick the Greek" )
    end
  end

  describe "bankroll" do
    it 'has a bankroll' do
      expect(player.bankroll).to eq(200_000)
    end
  end

  describe "#pay_winnings" do
    it "adds to winnings" do
      player.pay_winnings(200)
      player.bankroll.should == 200_200
    end
  end
  
  describe "Hand" do
    it "Has a hand" do
      expect(player.hand.class).to eq(Hand)
    end
  end
  
  # describe "#ask_user" do
  #   it 'asks whether they want to fold, see, or raise' do
  #     expect(player.ask_user).to eq('raise')
  #   end
  # end
  
  describe "#discard_cards" do
    it 'discards cards from hand' do
       expect(player.discard_cards([0, 2])).to eq(true)
    end
  end
end