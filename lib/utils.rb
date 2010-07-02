# TODO make thread safe 
module Utils
  
  def self.euler_sieve(max, &block)
    return [] if max < 2
    nums = Hash.new(true)
    (2..Math::sqrt(max).ceil).each do |i|
      if nums[i]
        prime = i
        yield prime if block
        upto = (max / i) + 1
        while i < upto
          nums[i * prime] = false
          i += 1
        end
      end
    end
    (2..max).inject([]) {|primes,x| nums[x] ? primes << x : primes}
  end

  def self.eratosthenes_sieve(n)
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

  def self.quad(a,b,c)
    inside = b**2 - (4 * a * c)
    negb = b * -1
    twoa = 2 *a
    ans1 = negb + Math.sqrt(inside) 
    ans2 = negb - Math.sqrt(inside) 
    return (ans1 / twoa), (ans2 / twoa)
  end
  
  def ppp(s)
    puts "*"*50
    puts s
    puts "*"*50
  end
end
