require File.dirname(__FILE__) + '/problem.rb'
require File.dirname(__FILE__) + '/utils.rb'
# Find the 10001st prime.

class Problem07 < Problem 
  include Utils
  
  def initialize; super end
    
  # TODO speed this up
  def problem(nth = 6,i = 13)
    while nth < 10001
      i += 2
      nth += 1 if i.is_prime?
    end
    i
  end
end
