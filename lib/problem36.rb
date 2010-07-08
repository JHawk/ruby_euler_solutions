# Find the sum of all numbers less than one million, which are palindromic in base 10 and base 2.
class Problem36 < Problem 
  def initialize; super end
  
  def problem(n=999999)
    (1..n).inject(0) {|s,i| i.palindromic? && i.to_s(2).palindromic? ? s += i : s}
  end
end
