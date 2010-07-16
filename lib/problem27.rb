# Find a quadratic formula that produces the maximum number of primes for consecutive values of n.
class Problem27 < Problem 
  def initialize 
    @coefficients = [] ; @max = 0
    super 
  end

  def check_max_primes(a,b) 
    n = 0
    t = 2
    while t.prime?
      t = n**2+a*n+b
      n += 1
    end
    if n > @max
      @max = n
      @coefficients = [a,b] 
    end
  end

  def problem(i=1000)
    primes = Utils::euler_sieve(i).unshift(1)
    primes.each do |a|
      primes.each do |b|
        check_max_primes(a,b)
        check_max_primes(-a,b)
        check_max_primes(a,-b)
        check_max_primes(-a,-b)
      end
    end
    @coefficients.inject(:*)
  end  
end
