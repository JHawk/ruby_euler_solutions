require File.dirname(__FILE__) + '/problem.rb'
# Find the first ten digits of the sum of one-hundred 50-digit numbers.
class Problem13 < Problem
  
  def initialize
    @data_13 = File.read("#{File.dirname(__FILE__)}/../data/big_num13.txt").gsub("\n", "")
    super
  end
  
  def problem
    nums = []
    sum = 0
    while !(@data_13.nil? || @data_13.empty?)
      nums << @data_13.slice!(0..49)
    end
    nums.each do |n|
      sum += n.to_i
    end
    sum.to_s[0..9]
  end
end
