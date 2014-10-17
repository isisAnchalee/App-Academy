class Array
  def my_uniq
    output = []
    self.each do |val|
      output << val if !output.include?(val)
    end
    output
  end
  
  def two_sum
    output = []
    self.each_with_index do |val, ind|
      (ind...self.length).each do |ind2|
        output << [ind, ind2] if self[ind] + self[ind2] == 0
      end
    end
    output
  end
end
