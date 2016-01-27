def bsearch(array,target)
  if array.count == 1
    return 0 if array[0] == target
    return nil
  end


  pivot_index = array.count / 2
  pivot = array[pivot_index]

  return pivot_index if pivot == target

  left = array[0...pivot_index]
  right = array[(pivot_index + 1)..-1]

  if pivot > target
    bsearch(left, target)
  else
    index_in_right = bsearch(right, target)
    if index_in_right.nil?
      return nil
    else
      return index_in_right + (pivot_index + 1)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  p bsearch([1, 2, 3], 1) # => 0
  p bsearch([2, 3, 4, 5], 3) # => 1
  p bsearch([2, 4, 6, 8, 10], 6) # => 2
  p bsearch([1, 3, 4, 5, 9], 5) # => 3
  p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
  p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
  p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
end
