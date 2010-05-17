require File.dirname(__FILE__) + '/problem.rb'
require File.dirname(__FILE__) + '/utils.rb'
# What is the value of the first triangle number to have over five hundred divisors?
class Problem12 < Problem 
  include Utils

  def initialize; super end

  def problem(d_count=500)

=begin
    tri_n = 1
    i = 1
    while divisors_count(tri_n) <= d_count
      i += 1
      tri_n += i
    end
    tri_n
=end

  end
end
