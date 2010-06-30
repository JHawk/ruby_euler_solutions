require File.dirname(__FILE__) + '/problem.rb'

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
class Problem24 < Problem
  def initialize; super end
  
  # TODO make this use each permutation or make a detect permutation that short circuits 
  def problem(a=[0,1,2,3,4,5,6,7,8,9], n=1000000) a.permutations[n-1] end
end
