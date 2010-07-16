# Which prime, below one-million, can be written as the sum of the most consecutive primes?
class Problem50 < Problem 
  def initialize ; super end

  def problem(i=5000)
    primes = Utils::euler_sieve(i)
    n = 0
    loop do 
      (0..n).each do |idx|
        num = primes[idx..primes.size-1-(n-idx)].sum
        return num if num < 1000000 && num.prime? 
      end
      n += 1
    end
  end  
end
