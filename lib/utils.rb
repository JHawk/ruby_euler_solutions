module Utils
  def is_prime?(n)
    2.upto(Math.sqrt(n)) do |i|
      return false if n % i == 0
    end
    return true
  end

  def trial_prime_factors(n)
    factors = []
    (2..n).each do |i|
      while n % i == 0 
        factors << i 
        n /= i
      end
    end
    factors
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
