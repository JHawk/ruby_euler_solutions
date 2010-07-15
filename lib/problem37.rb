require File.dirname(__FILE__) + '/utils.rb'
# Find arithmetic sequences, made of prime terms, whose four digits are permutations of each other.
class Problem37 < Problem 
  def initialize ; super end

  def problem
    interesting_primes = []
    @primes = Utils::euler_sieve(1000000) do |prime| 
      if truncate(prime) && truncate(prime,true) && prime.to_s.size > 1
        interesting_primes << prime 
      end
    end
    interesting_primes.sum
  end  
  
  private 
  
  def truncate(prime,right=false) 
    prime = prime.to_s.split(//)
    prime = prime.reverse if right
    (0..prime.size-1).all? do |idx|
      part = prime[idx..prime.size-1]
      right ? part.reverse.join.to_i.prime? : part.join.to_i.prime?
    end
  end
end
