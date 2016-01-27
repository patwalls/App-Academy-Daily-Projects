require 'byebug'

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if empty?
      nil
    else
      @head.next
    end
  end

  def last
    if empty?
      nil
    else
      @tail.prev
    end
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |link|
      if link == @last
        return nil
      elsif link.key == key
        return link.val
      end
    end
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    if first.nil?
      link = Link.new(key, val)
      @head.next = link
      @tail.prev = link
    else
      link = Link.new(key, val)
      @tail.prev.next = link
      @tail.prev = link
    end
  end

  def remove(key)
    self.each do |link|
      if link.key == key
        link.next.prev, link.prev.next = link.prev.next, link.next.prev
      end
    end
  end

  def each(&prc)
    link = first
    until link == @tail
      prc.call(link)
      link = link.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
