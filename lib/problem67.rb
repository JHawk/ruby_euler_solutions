require File.dirname(__FILE__) + '/problem18.rb'
# Using an efficient algorithm find the maximal sum in the triangle?
class Problem67 < Problem18
  
  def initialize
    super
    @data = File.read("#{File.dirname(__FILE__)}/../data/triangle67.txt").split("\n").map do |r| 
      r.split.map(&:to_i)
    end
  end
end
