class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_counter = 0
    self.each_with_index do |el, i|
      hash_counter += el.hash % i.hash
    end
    hash_counter
  end
end

class String
  def hash
    split_string = self.split("")
    hash_counter = 0
    split_string.each_with_index do |el, i|
      hash_counter += el.ord.hash % i.hash
    end
    hash_counter
  end
end

class Hash
  def hash
    hash_arr = self.to_a.sort
    hash_counter = 0
    hash_arr.each_with_index do |el, i|
      hash_counter += el.hash % i.hash
    end
    hash_counter
  end
end
