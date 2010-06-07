require File.dirname(__FILE__) + '/problem.rb'
# What is the smallest number divisible by each of the numbers 1 to 20?
class Problem05 < Problem 
  require 'rational'  
  
  def initialize; super end
  
  def problem(n=20)
    (1..n).inject(1) {|p,i| p.lcm i}
  end
end
