require File.dirname(__FILE__) + '/utils.rb'
# Find the first four consecutive integers to have four distinct primes factors.
class Problem47 < Problem 
  def initialize ; super end

  def proper_number_of_factors_for_con_numbers?(x,n)
    factors = []
    (x..x+n-1).each do |i|
      pds = i.prime_divisors.to_a
      return false if pds.size != n || pds.any? {|pd| factors.include?(pd)}
      factors + pds
    end 
    true
  end

  def total_factor_count(n) 
  
    puts m = n**4+6*n**3+11*n**2+6*n
  
    t = m.prime_divisors.size 
    
    puts "t => #{t} : n => #{n}"
    t
  end 

  def problem(n=4)
    i = 1
    target = [14,15]
    while !(target.include?(total_factor_count(i)) && proper_number_of_factors_for_con_numbers?(i,n))
      i += 1 
    end
    i
  end  
end
