require File.dirname(__FILE__) + '/problem.rb'
require File.dirname(__FILE__) + '/utils.rb'

# Evaluate the sum of all amicable pairs under 10000.
class Problem21 < Problem
  def initialize ; super end

  # returns the amicable pair of the number or nil 
  def amicable_other n
    ap = Utils::sum_proper_divisors n 
    ap if ap != n && n == Utils::sum_proper_divisors(ap)
  end
  
  def problem(n=10000)
    (4..n).inject(0) {|s,i| amicable_other(i) ? s + i : s} if n >= 4
  end
end
