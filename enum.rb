require 'byebug'
class Array

  def my_each(&block)


    i=0
    while i < self.length
      block.call(self[i])
      i += 1
    end

  end

  def my_select(&block)
    ary = []
    self.my_each do |el|
      ary << el if block.call(el)
    end
    ary
  end

  def my_reject(&block)
    ary = []
    self.my_each do |el|
      ary << el unless block.call(el)
    end
    ary
  end

  def my_any?(&block)
    self.my_each do |el|
      if block.call(el)
        return true
      end
    end
    false
  end

  def my_flatten
    i=0
    out_arr = []
    self.my_each do |el|
      if el.is_a?(Array)
        el.my_flatten.my_each {|subvalue| out_arr << subvalue}
      else
        out_arr << el
      end

    end

    out_arr

  end

  def my_zip(*arys)
    # puts self.length
    # puts arys.length

    out = []
    i = 0
    tidy_arrays = []
    tidy_arrays = tidy_arrays.push(self,*arys)


    while i < self.length
      subarray =[]

      tidy_arrays.each do |array|
        subarray << array[i]
      end
      out << subarray

      i += 1
    end

    out

  end

  def my_rotate(num=1)
    working = self.dup

    if num < 0
      num = num.abs
      num.times do
        back = working[-1]
        working.pop
        working.unshift(back)
      end
      return working

    end
      num.times do
        front = working[0]
        working.shift
        working.push(front)
      end
    working
  end

  def my_join(separator="")
    out = ""
    out = self.inject("") do |string,word|
      string << word + separator
    end
    if separator != ""
      out = out.chop
    end
    out
  end

  def my_reverse
    ary = self.dup
    result = []
    until ary == []
      result << ary.pop
    end
    result
  end


end


p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
