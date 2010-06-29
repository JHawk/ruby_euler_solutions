# TODO make thread safe 
module Utils
  
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

=begin TODO some day care enough to fix this attempt at a non brute force algo 
  @@divisors_hash = {}

  def proper_divisors(n)
    def add_power(set,i,max,p=1)
      if set.include? i
        sq = i**p
        add_power(set,sq,max,p+1) if sq < max && max % sq == 0
      else 
        set << i
      end 
      set     
    end 
    
    def inner(v,max)
      
      ppp v
    
      return @@divisors_hash[v] if @@divisors_hash[v]
      set = [1]
      (2..(v/2).ceil).each do |i|
        if v % i == 0 
          set = inner(v/i,max)
          set = add_power(set,i,max)
          set = add_power(set,v/i,max)
        end
      end
      set
    end
    
    @@divisors_hash[n] ? @@divisors_hash[n] : (@@divisors_hash[n] = inner(n,n))
  end
=end
  
  # brute force - probably a better way 
  def self.proper_divisors(n)
    (1..(n/2).ceil).inject([]) {|a,i| n % i == 0 ? a << i : a}
  end
    
  @@sum_proper_divisors = {}
    
  def self.sum_proper_divisors(n)
    @@sum_proper_divisors[n] ||= self.proper_divisors(n).inject(:+) || 0 
  end
  
  def self.abundant?(n) self.sum_proper_divisors(n) > n end
 
  def self.abundants(n) (12..n).select {|i| self.abundant? i} end
  
  def ppp(s)
    puts "*"*50
    puts s
    puts "*"*50
  end
end
