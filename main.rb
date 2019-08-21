# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < size
      yield (self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < size
      yield(self[i], i)
      i += 1
      self
    end
  end

  def my_select
    result = []
    my_each { |item| result.push(item) if yield(item) }
    result
  end

  def my_all?
    my_each { |item| eturnr false if yield(item) == false }
    true
  end

  def my_any?
    my_each { |item| return true if yield(item) }
    false
  end

  def my_none?
    result = true
    my_each do |item|
      if yield(item)
        result = false
        break
      end
    end
    result
  end

  def my_count
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    else
      count = size
    end
    count
  end

  def my_map(proc = nil)
    new_array = []
    if proc.nil?
      my_each { |i| new_array << yield(i) }
    elsif !proc.nil? && block_given?
      my_each { |i| new_array << proc.call(i) }
    else
      my_each { |i| new_array << proc.call(i) }
    end
    new_array
  end

  def my_inject
    i = 1
    sum = self[0]
    while i < size
      sum = yield(sum, self[i])
      i += 1
    end
    sum
  end
end

def multiply_els(array)
  array.my_inject { |product, item| product * item }
end

ary = [1, 2, 4, 2]
puts multiply_els(ary)
