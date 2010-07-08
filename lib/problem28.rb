# What is the sum of both diagonals in a 1001 by 1001 spiral?
class Problem28 < Problem 
  def initialize; super end
  
  def problem(n=1001) (3..n).step(2).inject(1) {|s,i| s += 4*i**2-6*(i-1)} end
end
