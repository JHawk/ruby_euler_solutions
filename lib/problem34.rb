# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
class Problem34 < Problem 
  def initialize; super end
  
  def sum_fact(i) i.to_s.split(//).inject(0) {|s,d| s += d.to_i.factorial} end
  
  def problem 
    # no number over 2.55 million could be part of this set -> 9! * 7 => 2540160
    # the bound is actually much lower - this is slow, but if i bothered to find 
    # a better bound, it would narrow it to a reasonable search space
    (3..9.factorial*7).inject(0) {|sum, i| i == sum_fact(i) ? sum += i : sum}
  end  
end
