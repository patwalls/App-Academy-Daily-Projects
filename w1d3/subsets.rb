class Array

  def subsets
    return [self] if self.empty?
    # remove last element from array, hold in some variable
    last_el = self[-1]

    # find combinations of whats left in the array
    sub_subsets = self[0...-1].subsets

    # use all of the subsets and concatenate them with the last element shoved in
    sub_subsets + sub_subsets.map { |sub_subset| sub_subset.dup << last_el }
  end
end
