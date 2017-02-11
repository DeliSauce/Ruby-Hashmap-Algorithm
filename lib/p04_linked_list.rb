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
    @head = Link.new(nil, nil)
    @tail = Link.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    each do |link|
      if link.key == key
        link.val = val
        return
      end
    end

    new_link = Link.new(key, val)

    prev_link = @tail.prev
    prev_link.next = new_link
    new_link.prev = prev_link
    new_link.next = @tail
    @tail.prev = new_link
  end

  def remove(key)
    each do |link|
      if link.key == key
        prev_link = link.prev
        next_link = link.next
        next_link.prev = prev_link
        prev_link.next = next_link
      end
    end
    nil
  end

  def each
    current = @head.next
    until current == @tail
      yield current
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
