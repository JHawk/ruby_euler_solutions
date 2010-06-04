require File.dirname(__FILE__) + '/problem.rb'
# Find the maximum sum travelling from the top of the triangle to the base.
class Problem18 < Problem
  
  def initialize
    @data_18 = File.read("#{File.dirname(__FILE__)}/../data/triangle18.txt").split("\n").map do |r| 
      r.split.map(&:to_i)
    end
    super
  end
  
  def problem(data = @data_18)
    (data.size-2).downto(0).each do |i|
      (0..(data[i].size-1)).each do |j|
        data[i][j] += [data[i+1][j],data[i+1][j+1]].max
      end
    end
    data[0][0]
  end
end
