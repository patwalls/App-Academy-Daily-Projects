class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el if !result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    self.each_with_index do |el1, idx1|
      self.each_with_index do |el2, idx2|
        next if idx2 <= idx1
        result << [idx1, idx2] if el1 + el2 == 0
      end
    end

    result
  end

  def my_transpose
    result = []
    ary_dup = self.dup
    self.each_with_index do |row, idx1|
      sub_result = []
      row.each_index do |idx2|
        sub_result << ary_dup[idx2][idx1]
      end
      result << sub_result
    end
    result
  end

  def stock_picker
    [self.index(self.min),self.index(self.max)]
  end
end
