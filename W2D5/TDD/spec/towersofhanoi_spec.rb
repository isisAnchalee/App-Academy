require 'towersofhanoi'

RSpec.describe TowersOfHanoi do
  subject(:game){ TowersOfHanoi.new }
  let(:player){ double("player") }
  
  
  
  describe "#towers" do
    it 'has three towers' do
      expect(game.towers.length).to eq(3)
    end
    
    it 'has a towers method that returns an array' do
      expect(game.towers).to be_instance_of(Array)
    end
    
    it 'returns array of arrays' do
      expect(game.towers.sample).to be_instance_of(Array)
    end
    
    it 'has three disks in the collective towers' do
      expect(game.towers.inject(0) { |sum,val| sum + val.length }).to eq(3)
    end
    
  end
  
  describe "#move" do
    it 'removes removes a disk from one tower and adds to another' do
      game.move(0, 1)
      expect(game.towers).to eq([[3,2],[1],[]])
    end
    
    it 'adds disks to tower one' do
      game.move(0, 1)
      expect(game.towers).to eq([[3,2],[1],[]])
    end
    
    it "doesn't add larger disks on top of smaller ones" do
      test_game = TowersOfHanoi.new([[1],[2],[3]])
      expect{ test_game.move(2, 0) }.to raise_error(RuntimeError)
    end
    
    it 'cannot remove disks from empty tower' do
      expect{ game.move(1,2) }.to raise_error()
    end
    
  end
  
  describe '#render' do
    it 'prints the board, returns nil' do
      expect( game.render ).to eq(nil)
    end
    
  end
  
  describe '#won?' do
    it 'returns true if tower 0 and either towers 1 or 2 are empty' do
      test_game = TowersOfHanoi.new([[],[],[3,2,1]])
      p test_game.won? 
      expect( test_game.won? ).to be_truthy
    end
  end
end