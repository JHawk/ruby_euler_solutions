# redundant but problem must be required before all problems that inherit from it...
require File.dirname(__FILE__) + '/lib/problem.rb'

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
  
  def permutations 
    a = []
    self.each_permutation(nil,"") {|p| a << p} 
    a
  end
   
  def rotations 
    [self] + (0..self.size-2).map {|idx| self[idx+1..self.size-1] + self[0..idx]}
  end
  
  def palindromic?
    a = self.clone
    a.delete_at(a.size/2) unless a.size.even? 
    a[0..a.size/2-1] == a[a.size/2..a.size-1].reverse
  end
end

module Enumerable 
  def sum 
    raise "expected array of Numerics" unless self.all? {|i| i.kind_of? Numeric}
    self.inject(:+) 
  end
end

class Integer
  def palindromic? ; self.to_s.palindromic? end

  def recurring_cycle(i=1)
    rem_to_idx = {}
    ps = []
    idx = 0
    loop do  
      q, rem = i.divmod self
      ps << q
      return if rem == 0
      return ps[rem_to_idx[rem]..ps.length].join.to_i if rem_to_idx[rem]
      i = rem * 10
      idx += 1
      # index 0 in the ps array should always be the number before the decimal 
      # and not needed - no adjust of index necessary 
      rem_to_idx[rem] = idx 
    end
  end

  def even? ; self % 2 == 0 end  
  
  def prime?
    2.upto(Math.sqrt(self)) do |i|
      return false if self % i == 0
    end
    return true
  end
  
  def factorial ; self < 1 ? 1 : (1..self).inject(:*) end 
  
  def pandigital?
    s = self.to_s
    m = s.split(//).map(&:to_i).max
    s.size == s.squeeze.size && (1..m).all? {|d| s.count(d.to_s) == 1}
  end

  def each_permutation(&block) self.to_s.split(//).each_permutation(nil,"",&block) end
  
=begin TODO some day care enough to fix this attempt at a non brute force algo 
  @@divisors_hash = {}

  def proper_divisors(n)
    def add_power(set,i,max,p=1)
      if set.include? i
        sq = i**p
        add_power(set,sq,max,p+1) if sq < max && max % sq == 0
      else 
        set << i
      end 
      set     
    end 
    
    def inner(v,max)
      
      ppp v
    
      return @@divisors_hash[v] if @@divisors_hash[v]
      set = [1]
      (2..(v/2).ceil).each do |i|
        if v % i == 0 
          set = inner(v/i,max)
          set = add_power(set,i,max)
          set = add_power(set,v/i,max)
        end
      end
      set
    end
    
    @@divisors_hash[n] ? @@divisors_hash[n] : (@@divisors_hash[n] = inner(n,n))
  end
=end
  
  # brute force - probably a better way 
  def proper_divisors
    (1..(self/2).ceil).inject([]) {|a,i| self % i == 0 ? a << i : a}
  end
    
  @@sum_proper_divisors = {}
    
  def sum_proper_divisors
    @@sum_proper_divisors[self] ||= self.proper_divisors.inject(:+) || 0 
  end
  
  def abundant? ; self.sum_proper_divisors > self end
 
  def abundants ; (12..self).select {|i| i.abundant?} end
end

class String
  def palindromic? ; self.split(//).palindromic? end

  def each_permutation(&block) self.split(//).each_permutation(nil,"",&block) end
  
  def rotations ; self.split(//).rotations.map(&:join) end
end
