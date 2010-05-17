# TODO make thread safe 
module Utils
  def is_prime?(n)
    2.upto(Math.sqrt(n)) do |i|
      return false if n % i == 0
    end
    return true
  end

  def euler_sieve(n)
    return [] if n < 2
    nums = Hash.new(true)
    (2..Math::sqrt(n).ceil).each do |r|
      if nums[r]
        p = r
        h = (n / r) + 1
        while p < h  
          nums[r * p] = false
          p += 1
        end
      end 
    end    
    primes = []
    (2..n).each do |x|
      primes << x if nums[x]
    end
    primes
  end

  def eratosthenes_sieve(n)
    return [] if n < 2
    nums = Hash.new(true)
    even = 4
    while even <= n
      nums[even] = false
      even += 2
    end
    odd = 3
    while odd <= n / 2
      x = odd * 2
      while x <= n 
        nums[x] = false
        x += odd
      end
      odd += 2 
    end
    primes = []
    (2..n).each do |x|
      primes << x if nums[x]
    end
    primes
  end

  # TODO - speed up - very slow
  def trial_prime_factors(n)
    factors = []
    (2..n/2).each do |i|
      while n % i == 0 
        factors << i 
        n /= i
      end
    end
    factors
  end
  
  def divisors_count(n)
    pf = trial_prime_factors(n)
    pf.uniq.inject(1) {|prod,uf| (pf.count(uf) + 1) * prod}
  end
  
  def quad(a,b,c)
    inside = b**2 - (4 * a * c)
    negb = b * -1
    twoa = 2 *a
    ans1 = negb + Math.sqrt(inside) 
    ans2 = negb - Math.sqrt(inside) 
    return (ans1 / twoa), (ans2 / twoa)
  end
end
