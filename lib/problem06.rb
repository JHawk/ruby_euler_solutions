require File.dirname(__FILE__) + '/problem.rb'
# What is the difference between the sum of the squares and the square of the sums?
class Problem06 < Problem 

  def initialize; super end

  def problem(last = 100)
    sum = 0
    sum_sq = 0
    (1..last).each do |i|
      sum += i
      sum_sq += i * i
    end
    (sum *= sum) - sum_sq
  end
end
