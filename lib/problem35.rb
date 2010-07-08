require File.dirname(__FILE__) + '/utils.rb'

# Find the sum of all numbers that can be written as pandigital products.
class Problem35 < Problem 
  def initialize; super end
  
  def problem(n=1000000)
    count = 0 
    Utils::euler_sieve(n) {|p| count += 1 if p.to_s.rotations.all? {|r| r.to_i.prime?}}
    count
  end
end
