require File.dirname(__FILE__) + '/problem.rb'

# What is the first term in the Fibonacci sequence to contain 1000 digits?
class Problem25 < Problem
  def initialize ; super end

  def problem(n=1000)
    a = 0
    b = 0
    t = 1
    c = 1
    while t.to_s.length < n
      a = b
      b = t
      t = a + b
      c += 1
    end
    c
  end
end
