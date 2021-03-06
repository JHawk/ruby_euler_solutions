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
  
  def each_permutation_true(idx = nil, arr = [], &block)
    idx ||= (0..(self.size - 1)).to_a
    if idx.empty?
      yield arr
    else  
      idx.each {|i| each_permutation_true(idx - [i], arr + [self[i]], &block)}
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

  # approx 
  def fermat_prime?(t=7)
    return false if self < 2
    t.times {return false if self.mod_pow(rand(self-1)+1) > 1}
    true
  end

  def mod_pow(n) 
    result = 1
    e = self - 1
    while e > 0
      result = (result * n) % self if e.odd?
      e /= 2
      n = n**2 % self
    end
    result
  end

  def even? ; !self.odd? end 
  
  def odd? ; self & 1 == 1 end
  
  def prime?
    return false if self <= 1
    2.upto(Math.sqrt(self)) do |i|
      return false if self % i == 0
    end
    return true
  end
  
  def factorial ; self < 1 ? 1 : (1..self).inject(:*) end 
  
  def pandigital?(zero=nil)
    arr = self.to_s.split(//).map(&:to_i)
    max = zero ? arr.max + 1 : arr.max 
    arr.size == max && (zero ? (0..max-1) : (1..max)).all? {|d| arr.count(d) == 1}
  end

  def each_permutation(&block) self.to_s.split(//).each_permutation(nil,"",&block) end
  
  # brute force - probably a better way 
  def proper_divisors
    (1..(self/2).ceil).inject([]) {|a,i| self % i == 0 ? a << i : a}
  end
  
  # ugly, ugly... UGLY!
  def prime_divisors
    h = {}
    (2..(self/2).ceil).each do |n|
      if self % n == 0 && n.prime?
        count = 0 
        power = 0
        n_raised = n
        while n_raised < self
          power += 1
          n_raised = n**power
          if self % n_raised == 0
            count += 1  
          else
            break
          end
        end
        h[n] = count unless count == 0 
      end
    end
    h
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
  
  def permutations 
    a = []
    self.each_permutation {|p| a << p} 
    a
  end
  
  def anagram?(o) ; self.split(//).sort.join == o.split(//).sort.join end
  
  def rotations ; self.split(//).rotations.map(&:join) end
end
