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
end
