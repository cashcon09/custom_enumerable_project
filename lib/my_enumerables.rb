module Enumerable
  # Your code goes here
  def my_all?
    bool = false
    self.my_each do |item|
      return false if !yield(item)
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_count
    count = 0
    return self.length unless block_given?

    self.my_each do |item|
      count += 1 if yield(item)
    end
    count
  end

  def my_each_with_index
    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_inject(initial_value)
    count = initial_value
    self.my_each do |item|
      count = yield(item, count)
    end
    count
  end

  def my_map
    arr = []
    self.my_each do |item|
      arr.push(yield(item))
    end
    arr
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_select
    arr = []
    self.my_each do |item|
      arr.push(item) if yield(item)
    end
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each {|item| yield(item)}
  end
end
