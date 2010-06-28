# TODO make thread safe 
module Utils
  
  def is_prime?(n)
    2.upto(Math.sqrt(n)) do |i|
      return false if n % i == 0
    end
    return true
  end

  def euler_sieve(max)
    return [] if max < 2
    nums = Hash.new(true)
    (2..Math::sqrt(max).ceil).each do |i|
      if nums[i]
        prime = i
        upto = (max / i) + 1
        while i < upto
          nums[i * prime] = false
          i += 1
        end
      end
    end
    (2..max).inject([]) {|primes,x| nums[x] ? primes << x : primes}
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

  def quad(a,b,c)
    inside = b**2 - (4 * a * c)
    negb = b * -1
    twoa = 2 *a
    ans1 = negb + Math.sqrt(inside) 
    ans2 = negb - Math.sqrt(inside) 
    return (ans1 / twoa), (ans2 / twoa)
  end
  
  # brute force - probably a better way 
  def self.proper_divisors(n)
    (1..(n/2).ceil).inject([]) {|a,i| n % i == 0 ? a << i : a}
  end
    
  @@sum_proper_divisors = {}
    
  def self.sum_proper_divisors(n)
    @@sum_proper_divisors[n] ||= Utils::proper_divisors(n).inject(:+)
  end
  
  def ppp(s)
    puts "*"*50
    puts s
    puts "*"*50
  end
end
