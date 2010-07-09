require File.dirname(__FILE__) + '/utils.rb'
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
class Problem46 < Problem 
  def initialize
    @primes = Utils::euler_sieve(100000)
    super 
  end  

  def goldbach_composite?(n)
    @primes.any? do |p|
      return false if p > n
      Math::sqrt((n - p) / 2) % 1 == 0
    end
  end
  
  def problem
    n = 9
    loop do
      unless n.prime?
        return n unless goldbach_composite?(n)
      end
      n += 2 
    end
  end  
end
