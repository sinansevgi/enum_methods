def my_each(array)
  for item in array
    yield item
  end
end

def my_each_with_index(array)
  for i in (0...array.length)
    yield i, array[i]
  end
end

def my_select(array, filter)
  for i in array
    yield i if i != filter
  end
end

def my_all(array)
  for i in 0...array.length
    if(!yield array[i])
      return false
    end
  end
  return true
end

def my_any(array)
  for i in 0...array.length
    if(yield array[i])
      return true
    end
  end
  return false
end

def my_none(array)
  for i in 0...array.length
    if(yield array[i])
      return false
    end
  end
  return true
end

def my_count(array)
  count = 0
  for i in 1..array.length
    count += 1
  end
  count
end

def my_map

end

def my_inject

end

#
# my_each ([3, 4, 5, 6]) do |item|
#   print item
# end

# my_each_with_index([3, 4, 5, 6]) do |index, item|
#   puts "Index : #{index} and Value #{item}"
# end

# my_select([3, 4, 5, 6, 2], 6) do |item|
#   puts item
# end
#


my_All_res = my_all(%w[dcd fdfdf dfdf dfdf dfdfd]) do |item|
  true if item.length > 6
end

my_any_res = my_any(%w[dcd fdfdf dfdf dfdf dfdfdas]) do |item|
  true if item.length > 6
end

my_none_res = my_none(%w[dcd fdfdf dfdf dfdf dfdf]) do |item|
  true if item.length > 6
end

puts my_All_res
puts my_any_res
puts my_none_res
puts my_count([43,34,35,'sds',3434]);