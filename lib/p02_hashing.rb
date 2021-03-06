class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    hashing_value = 0;
    self.each_with_index do |el, idx|
      hashing_value += el.hash * idx.hash
    end
    hashing_value
  end
end

class String
  def hash
    self.chars.map do |char|
      char.ord
    end.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashing_value = 0
    self.each do |key, value|
      hashing_value += key.hash + value.hash
    end
    hashing_value
  end
end
