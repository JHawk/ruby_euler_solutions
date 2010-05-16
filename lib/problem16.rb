require File.dirname(__FILE__) + '/problem.rb'
# What is the sum of the digits of the number 21000?
class Problem16 < Problem
  def problem
    a = 2**1000
    a = a.to_s.split(//)
    a.inject(0) {|sum,n| sum + n.to_i}
  end
end
