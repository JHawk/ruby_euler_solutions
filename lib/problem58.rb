# Investigate the number of primes that lie on the diagonals of the spiral grid.
class Problem58 < Problem 
  def initialize ; super end

  def problem(dec=0.1)
    count = 0.0 
    side = 3
    last = side**2
    d = side - 1
    corners = [last, last - d, last - d*2, last - d*3]
    diagonal = 5.0
    Utils::euler_sieve(700000000) do |prime|
      if prime > last
        return side if count / diagonal < dec
        side += 2
        last = side**2 
        d = side - 1
        corners = [last, last - d, last - d*2, last - d*3]
        diagonal += 4
      end
      count += 1 if corners.include?(prime)  
    end
  end  
end
