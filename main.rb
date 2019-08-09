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

  def my_select
    result = []
    self.my_each {|item| result.push(item) if yield(item)}
    result
  end

  def my_all?
    self.my_each {|item| eturnr false if yield(item) == false}
    true
  end

  def my_any?
    self.my_each {|item| return true if yield(item)}
    false
  end

  def my_none?
    result = true
    self.my_each do |item| 
      if yield(item)
        result = false
        break
      end
    end
    result
  end

end

puts %w{ant bear cat}.my_none? { |word| word.length >= 4 }
