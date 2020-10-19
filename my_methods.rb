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

def my_all

end

def my_any

end

def my_none

end

def my_count

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