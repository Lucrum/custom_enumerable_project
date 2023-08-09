module Enumerable
  # Your code goes here
  def my_each_with_index
    return unless block_given?

    ind = 0
    for i in self
      yield i, ind
      ind += 1
    end
  end

  def my_select
    return unless block_given?

    res = []
    for i in self
      res.append(i) if yield i
    end
    res
  end

  def my_all?
    return unless block_given?

    for i in self
      return false unless yield i

    end
    true
  end

  def my_any?
    return unless block_given?

    for i in self
      return true if yield i

    end
    false
  end

  def my_none?
    return unless block_given?

    for i in self
      return false if yield i
    end
    true
  end

  def my_count
    return length unless block_given?

    count = 0
    for i in self
      count += 1 if yield i
    end
    count
  end

  def my_map
    return self unless block_given?

    res = []
    for i in self
      res.append(yield i)
    end
    res
  end

  def my_inject(initial)
    return unless block_given?

    for i in self
      initial = yield i, initial
    end
    initial
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return unless block_given?

    for i in self
      yield i
    end
  end
end
