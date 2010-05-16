require File.dirname(__FILE__) + '/problem.rb'
require File.dirname(__FILE__) + '/utils.rb'
# What is the smallest number divisible by each of the numbers 1 to 20?
class Problem05 < Problem 
  include Utils
  
  def initialize; super end
  
  def problem(n=20)
    factor_h = {} # prime => max number of occurrences 
    (2..n).each do |i| 
      h = {}
      trial_prime_factors(i).each {|f| h[f] = h[f] + 1 rescue 1} 
      h.each {|k,v| factor_h[k] = h[k] unless factor_h[k] && factor_h[k] > h[k]}
    end
    factor_h.inject(1) {|a,h| a * h.first**h.last}
  end
end
