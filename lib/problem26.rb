# Find the value of d < 1000 for which 1/d contains the longest recurring cycle.
class Problem26 < Problem 
  def initialize; super end
  
  def problem(n = 1000) 
    cycles = (1..n).map {|i| i.recurring_cycle.to_s.size}
    cycles.index(cycles.max) + 1
  end
end
