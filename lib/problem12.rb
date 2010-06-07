require File.dirname(__FILE__) + '/problem.rb'
require File.dirname(__FILE__) + '/utils.rb'
# What is the value of the first triangle number to have over five hundred divisors?
class Problem12 < Problem 
  include Utils

  attr_accessor :pfs, :primes

  def initialize
    @pfs = {}
    @primes = euler_sieve 100000
    super 
  end

  def triangle_num(n) (n * (n + 1)) / 2 end
  
  def prime_factors(n)
    return @pfs[n] if @pfs[n]
    @primes = euler_sieve n if n/2.ceil > @primes.last
    @primes.each do |prime|
      if n % prime == 0 
        return @pfs[n] = prime_factors(n / prime).merge({prime => 1}) {|k,o,n| k == 1 ? 1 : o+n}
      end
    end
    return @pfs[n] = {n => 1}
  end
  
  def divisors_count(n)
    prime_factors(n).values.inject {|prod,divisor| prod * (divisor + 1)}
  end
  
  def problem(factor_min=500)
    i = 1
    tri_n = 1
    while divisors_count(tri_n) <= factor_min
      tri_n = triangle_num(i += 1)
    end
    tri_n
  end
end
