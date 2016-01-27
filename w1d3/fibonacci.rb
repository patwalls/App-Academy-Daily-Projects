def fib_recursive(num)
  return [0, 1].take(num) if num <= 2
  sequence = fib_recursive(num - 1)
  sequence << sequence[-1] + sequence[-2]
end

def fib_iterative(num)
  sequence = [0,1]
  return [] if num == 0
  if num < 3
    return sequence.take(num)
  else
    until sequence.count == num
      sequence << sequence[-1] + sequence[-2]
    end
  end
  sequence
end
