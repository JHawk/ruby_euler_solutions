require File.dirname(__FILE__) + '/problem.rb'
require 'set'

# How many distinct terms are in the sequence generated by ab for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?
class Problem29 < Problem 
  def initialize 
    @terms = Set.new
    super 
  end
  
  # Ruby Sets and Big Num makes this too easy... 
  def problem(a=100,b=100)
    (2..a).inject(0) {|s1,i| s1 += (2..b).inject(0) {|s2,j| @terms.add?(i**j) ? s2 += 1 : s2}}
  end
end
