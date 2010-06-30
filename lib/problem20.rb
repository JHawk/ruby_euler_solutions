require File.dirname(__FILE__) + '/problem.rb'

# Find the sum of digits in 100!
class Problem20 < Problem
  
  def initialize; super end

  def problem(n=100) n.factorial.to_s.split(//).inject(0) {|s,d| s += d.to_i} end
end
