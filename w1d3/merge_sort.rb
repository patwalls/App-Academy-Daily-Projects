def merge_sort(ary)
  return ary if ary.count <= 1

  # split in half
  left, right  = split(ary)
  # sort each half
  sorted_left  = merge_sort(left)
  sorted_right = merge_sort(right)
  # merge halves
  merge(sorted_left, sorted_right)
end


def split(ary)
  return ary if ary.count <= 1

  split_position = ary.count / 2

  left  = ary[0...split_position]
  right = ary[split_position..-1]
  [left, right]
  # split(left)
  # split(right)
end

def merge(left, right)
  merged = []
  left_position  = 0
  right_position = 0
  while left_position < left.count && right_position < right.count
    left_el = left[left_position]
    right_el = right[right_position]

    if left_el < right_el
      merged << left_el
      left_position += 1
    else
      merged << right_el
      right_position += 1
    end
  end
  merged += left[left_position..-1] + right[right_position..-1]
end
