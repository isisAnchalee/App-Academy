require 'array'

RSpec.describe Array do
  subject(:test_array){ [1, -1, 2, 3, 4, 4] }
  describe '#my_uniq' do
    it 'produces an array of uniq elements' do
      expect(test_array.my_uniq).to eql([1, -1, 2, 3, 4])
    end
  end
  
  describe '#two_sum' do
    it 'finds all zero summing element positions' do
      expect(test_array.two_sum).to eq([[0, 1]])
    end
    it 'returns smaller elements first' do 
      new_test_array = [1, 2, -1, -2, 3, 4, 5]
      expect(new_test_array.two_sum).to eq([[0,2],[1,3]])
    end
  end

end