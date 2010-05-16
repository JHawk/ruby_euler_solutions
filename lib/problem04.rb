require File.dirname(__FILE__) + '/problem.rb'
# Find the largest palindrome made from the product of two 3-digit numbers.
class Problem04 < Problem
  def initialize; super end
  
  def problem(start = 999)
    while start > 0
      i = start - 1
      while i > (start - 100)
        p = start * i
        return p if p.to_s == p.to_s.reverse
        i -= 1
      end
      start -= 1
    end
  end
end
