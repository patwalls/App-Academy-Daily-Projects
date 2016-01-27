# Uses recursion to generate a range
def range(first, last)
  return [] if first > last
  # return [first] if first == last
  range(first, last - 1) + [last]
end

# Uses iteration to generate a range
def iterative_range(first, last)
  (first..last).to_a
end

# Uses recursion to raise a base b to power n
def exp(b, n)
  # $depth1 += 1
  return 1 if n.zero?
  exp(b, n - 1) * b
end

# Uses recursion to raise a base b to power n faster
def exp_2(base, exponent)
  # $depth2 += 1
  return 1 if exponent.zero?
  return base if exponent == 1

  if exponent.even?
    return square(exp_2(base, exponent / 2))
  else
    return base * square(exp_2(base, (exponent - 1) / 2))
  end
end

def square(num)
  num * num
end
