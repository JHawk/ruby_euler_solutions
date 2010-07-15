# TODO make thread safe 
module Utils
  
  def self.triangle_numbers(max, &block)
    nums = []
    return nums if max < 1
    n = 1
    t = 1 
    while t <= max
      nums << t
      yield t if block
      n += 1
      t = (n**2 + n)/2
    end
    nums
  end
    
  def self.euler_sieve(max, &block)
    return [] if max < 2
    nums = Array.new(max+1,true)
    nums[0] = false
    nums[1] = false
    (2..max).each do |i|
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
    primes = []
    nums.each_with_index {|b,idx| primes << idx if b}
    primes
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
