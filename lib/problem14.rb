require File.dirname(__FILE__) + '/problem.rb'
# Find the longest sequence using a starting number under one million.
class Problem14 < Problem 
  
  attr_accessor :steps
  
  def initialize 
    @steps = {}
    super 
  end

  def get_steps(start)
    return @steps[start] if @steps[start]
    if start == 1
      return @steps[start] = start 
    elsif start % 2 == 0
      return @steps[start] = get_steps(start / 2) + 1
    else
      return @steps[start] = get_steps(3*start + 1) + 1
    end
  end

  def problem(top=1000000)
    n = 0 
    longest_seq = 0
    most_steps = 0 
    while n < top 
      n += 1
      steps = get_steps(n)
      if most_steps < steps
        longest_seq = n 
        most_steps = steps
      end
    end 
    longest_seq
  end
end
