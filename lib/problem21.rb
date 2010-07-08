# Evaluate the sum of all amicable pairs under 10000.
class Problem21 < Problem
  def initialize ; super end

  # returns the amicable pair of the number or nil 
  def amicable_other n
    ap = n.sum_proper_divisors 
    ap if ap != n && n == ap.sum_proper_divisors
  end
  
  def problem(n=10000)
    (4..n).inject(0) {|s,i| amicable_other(i) ? s + i : s} if n >= 4
  end
end
