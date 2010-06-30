Dir[File.dirname(__FILE__) + '/lib/problem*.rb'].each {|file| require file}

# add methods to classes 
class Array
  def each_permutation(idx = nil, str = "", &block)
    idx ||= (0..(self.size - 1)).to_a
    if idx.empty?
      yield str
    else  
      idx.each {|i| each_permutation(idx - [i], str + self[i].to_s, &block)}
    end
  end
  
  def sum 
    raise "expected array of Integers" unless self.all? {|i| i.kind_of? Integer}
    self.inject(:+) 
  end
end

class Integer
  def even? ; self % 2 == 0 end  
  
  def prime?
    2.upto(Math.sqrt(self)) do |i|
      return false if self % i == 0
    end
    return true
  end
  
  def factorial ; (1..self).inject(:*) end 
  
  def pandigital?
    s = self.to_s
    m = s.split(//).map(&:to_i).max
    s.size == s.squeeze.size && (1..m).all? {|d| s.count(d.to_s) == 1}
  end

  def each_permutation(&block) self.to_s.split(//).each_permutation(nil,"",&block) end
end

class String
  def each_permutation(&block) self.split(//).each_permutation(nil,"",&block) end
end
