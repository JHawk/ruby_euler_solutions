require File.dirname(__FILE__) + '/problem.rb'
# Find the only Pythagorean triplet, {a, b, c}, for which a + b + c = 1000.
class Problem09 < Problem 
  def initialize; super end

  # TODO speed this up
  def problem
    a = 100
    while a < 500
      b = a + 1
      while b < 500
        c = b + 1
        while c < 500
          if (a + b + c) == 1000 && (a**2 + b**2) == c**2
            return a * b * c
          end
          c += 1
        end
        b += 1
      end
      a += 1
    end
  end
end
