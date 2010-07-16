# Find the sum of all pandigital numbers with an unusual sub-string divisibility property.
class Problem43 < Problem 
  def initialize
    @primes = [1] + Utils::euler_sieve(18)
    super 
  end

  def sub_divisible?(p)
    ps = p.to_s
    (1..ps.size-3).all? {|idx| ps[idx..idx+2].to_i % @primes[idx] == 0}
  end
  
  def problem
    sum = 0 
    "0123456789".each_permutation {|p| sum += p.to_i if sub_divisible? p} 
    sum
  end  
end
