class TowersOfHanoi
  class SizeError < StandardError
  end
  attr_reader :towers
  def initialize(towers = generate_towers)
    @towers = towers
  end
  
  def generate_towers
    [[3, 2, 1],[],[]]
  end
  
  def move(from_stack_num, to_stack_num)

     from_stack, to_stack =
       @towers.values_at(from_stack_num, to_stack_num)

     raise "cannot move from empty stack" if from_stack.empty?
     unless (to_stack.empty? || to_stack.last > from_stack.last)
       raise "cannot move onto smaller disk"
     end

     to_stack.push(from_stack.pop)
     self
   end
  
   def render
     puts @towers
   end
   
   def won?
     @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
   end
  
end