require File.dirname(__FILE__) + '/problem.rb'
# Calculate the sum of all the primes below two million.
class Problem10 < Problem 
  def initialize; super end

  def problem(max = 2000000)
    nums = Hash.new(true)
    sum = 0

    even = 4
    while even <= max
      nums[even] = false
      even += 2
    end

    odd = 3
    while odd < max
      x = odd * 2
      while x <= max
        nums[x] = false
        x += odd
      end
      odd += 2 
    end

    for x in (2..max)
      sum = sum + x if nums[x]
    end
    sum
  end
end
