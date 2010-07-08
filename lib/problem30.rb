# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
class Problem30 < Problem 
  def initialize; super end
  
  def sum_fifths(i) i.to_s.split(//).inject(0) {|s,d| s += d.to_i**5} end
  
  def problem 
    # no number over 1 million could be part of this set -> 9**5 * 7 => 413343 
    # the bound is clearly much lower 
    (2..9**5*7).inject(0) {|sum, i| i == sum_fifths(i) ? sum += i : sum}
  end
end
