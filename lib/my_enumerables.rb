module Enumerable
  # Your code goes here
  def my_each_with_index
    for index in (0...length) do
      yield self[index], index
    end
    self
  end

  def my_select
    results = []
    for value in self do
      results << value if yield value
    end
    results
  end

  def my_all?
    for value in self do
      return false unless yield value
    end
    true
  end

  def my_any?
    for value in self do
      return true if yield value
    end
    false
  end

  def my_none?
    for value in self do
      return false if yield value
    end
    true
  end

  def my_count
    return length unless block_given?

    counter = 0
    for value in self do
      counter += 1 if yield value
    end
    counter
  end

  def my_map
    results = []
    for value in self do
      results << (yield value)
    end
    results
  end

  def my_inject(intial_value = 0)
    result = intial_value
    for value in self do
      result = yield result, value
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for value in self do
      yield value
    end
  end
end
