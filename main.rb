module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield (self[i])
      i += 1
    end
    self
  end 

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i += 1
      self
    end
  end
end

[:foo, :bar, :baz].my_each_with_index(2) do |value, index|
  puts "#{index}: #{value}"
end