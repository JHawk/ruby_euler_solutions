require File.dirname(__FILE__) + '/problem.rb'
require File.dirname(__FILE__) + '/utils.rb'

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
class Problem23 < Problem
  def initialize  
    @sum_two_abunds = Hash.new(true)
    super 
  end

  # TODO very slow due to proper_divisors method in utils
  def problem(n=28123)
    abunds = Utils::abundants(n)
    abunds.each_with_index do |a,i|
      abunds[(i)..(abunds.length)].each do |j| 
        @sum_two_abunds[a+j] = false
      end
    end
    (1..n).inject(0) {|s,i| @sum_two_abunds[i] ? s+i : s}
  end
end
