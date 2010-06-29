require File.dirname(__FILE__) + '/problem.rb'

# What is the largest n-digit pandigital prime that exists?

class Problem41 < Problem
  def initialize ; super end

  def problem
    a = []
    [9,8,7,6,5,4,3,2,1].each_permutation do |x|
      a << x
    end
    a
  end
end
