# Find the first four consecutive integers to have four distinct primes factors.
class Problem47 < Problem 
  def initialize ; super end

  def proper_number_of_factors(x,n)  
    factors = []
    (x..x+n-1).each do |i| 
      pds = i.prime_divisors.to_a 
      return false if pds.size != n || pds.any? {|pd| factors.include?(pd)}
      factors + pds
    end 
    true
  end

  def problem(n=3)
    i = 1 
    loop do 
      return i if proper_number_of_factors(i,n)  
      i += 1
    end
  end  
end
