require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    index = num % num_buckets
    @store[index] << key
    @count += 1
    resize! if @count > num_buckets
  end

  def include?(key)
    num = key.hash
    index = num % num_buckets
    @store[index].include?(key)
  end

  def remove(key)
    num = key.hash
    index = num % num_buckets
    @store[index].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = HashSet.new(num_buckets * 2)
    @store.each do |bucket|
      bucket.each do |el|
        new_store.insert(el)
      end
    end
  end
end

# a = HashSet.new(8)
#
# a.insert([])
# p a
# p a.include?([[]])

#
# class ResizingIntSet
#   attr_reader :count
#
#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end
#
#   def insert(num)
#     index = num % num_buckets
#     @store[index] << num
#     @count += 1
#     resize! if @count > num_buckets
#   end
#
#   def remove(num)
#     index = num % num_buckets
#     @store[index].delete(num)
#   end
#
#   def include?(num)
#     index = num % num_buckets
#     @store[index].include?(num)
#   end
#
#   private
#
#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end
#
#   def num_buckets
#     @store.length
#   end
#
#   def resize!
#     new_store = ResizingIntSet.new(num_buckets * 2)
#     @store.each do |bucket|
#       bucket.each do |el|
#         new_store.insert(el)
#       end
#     end
#   end
# end
