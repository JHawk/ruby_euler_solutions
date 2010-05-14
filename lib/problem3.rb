require File.dirname(__FILE__) + '/problem.rb'
# Find the largest prime factor of a composite number.
class Problem3 < Problem  
  def initialize
    @data_3 = 600851475143
  end

  def problem
    while @data_3 > 70
      for i in (2..1000000)
        if @data_3 % i == 0
          d = i unless i == 1
          @data_3 /= i
        end
      end
    end
    d
  end
end
