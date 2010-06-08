require File.dirname(__FILE__) + '/problem.rb'
require File.dirname(__FILE__) + '/utils.rb'
# What is the value of the first triangle number to have over five hundred divisors?
class Problem12 < Problem 
  include Utils

  attr_accessor :pfs

  def initialize
    @pfs = {}
    @primes = euler_sieve 100000
    super 
  end

  def triangle_num(n) (n * (n + 1)) / 2 end
  
  def prime_factors(n)
    return @pfs[n] if @pfs[n]
    @primes = euler_sieve Math::sqrt(n) if n/2.ceil > @primes.last
    @primes.each do |prime|
      if n % prime == 0 
        return @pfs[n] = prime_factors(n / prime).merge({prime => 1}) {|k,o,n| k == 1 ? 1 : o+n}
      end
    end
    return @pfs[n] = {n => 1}
  end
  
  def divisors_count(pf_hash)
    pf_hash.values.inject {|prod,divisor| prod * (divisor + 1)} || 0
  end
  
  # TODO introduced a bug into this code somewhere
  def problem(factor_min=500)
    i = 2
    pf = {}
    while divisors_count(pf) <= factor_min 
      i += 1
      pf = prime_factors(i).merge(prime_factors(i + 1)) {|k,o,n| k == 1 ? 1 : o+n}
      pf[2] -= 1 if pf[2]
    end
    triangle_num(i)
  end
end
