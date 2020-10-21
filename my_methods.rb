# rubocop: disable Metrics/ModuleLength
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

module Enumerable

  def my_each
    return to_enum(:my_each) unless block_given?

    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end

    for item in array
      yield item
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end

    for i in (0...array.length)
      yield array[i], i
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end
    
    res = []
    for i in array
      res.push(i) if yield i
    end
    res
  end

  def my_all?(arg = nil)
    return false if (!block_given? && !arg)
    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end

    return true if array.empty?

    for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          return false if !array[i].is_a?(arg)
        elsif arg.class == Regexp
          return false if array[i].match(arg).nil?
        else
          return false  unless array[i] != arg
        end
      else
        if (!yield array[i])
          return false
        end
      end
    end

    return true
  end

  def my_any?(arg = nil)
    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end

    return false if array.empty?
    return true if array.include? true

    for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          return true if array[i].is_a?(arg)
        elsif arg.class == Regexp
          return true if array[i].match(arg).nil?
        else
          return true  unless array[i] != arg
        end
      else
        if (yield array[i])
          return true
        end
      end
    end
    return false
  end

  def my_none?(arg = nil)
    return true if (!block_given? && !arg)
    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end

    for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          return false if array[i].is_a?(arg)
        elsif arg.class == Regexp
          return false if array[i].match(arg).nil?
        else
          return false  unless array[i] != arg
        end
      else
        if (yield array[i])
          return false
        end
      end
    end

    return true
  end

  def my_count(arg = nil)
    return self.length  if (!block_given? && !arg)
    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end

    count = 0

     for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          count += 1 if array[i].is_a?(arg)
        elsif arg.class == Regexp
          count += 1 if array[i].match(arg).nil?
        else
          count += 1  unless array[i] != arg
        end
      else
        if yield array[i]
          count += 1
        end
      end
    end

    count
  end

  def my_map(arg = nil)
    return to_enum(:my_map)  if (!block_given? && !arg)

    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end

    result_array = []
    for item in array
      if arg
        result_array.push(arg.yield(item))
      else
        result_array.push(yield item)
      end
    end
    return result_array
  end

  def my_inject(arg1 = nil, arg2 = nil)
    # raise LocalJumpError  if (!block_given? or (!arg1 or !arg2))

    array = self
    case self.class
    when Range
      array = array.to_a
    when Hash
      array = array.values
    end
    result = array[0]
    result = arg1 if arg1 and !arg1.is_a? Symbol

    puts result

    for item in array
      if arg1
        if arg2
          result = result.send(arg2, item)
        elsif arg1.is_a? Symbol
          result = result.send(arg1, item)
        else  
          result = yield result, item
        end
      else
         result = yield result, item  
      end
    end
    return result
  end
end
