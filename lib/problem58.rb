# Investigate the number of primes that lie on the diagonals of the spiral grid.
class Problem58 < Problem 
  def initialize ; super end

  def problem(dec=0.1)
    count = 0.0 
    side = 3
    diagonal = 5.0
    loop do 
      last = side**2
      d = side - 1
      corners = [last, last - d, last - d*2, last - d*3]
      corners.each {|c| count += 1 if c.prime?}
      return side if count / diagonal < dec
      side += 2
      diagonal += 4
    end
  end  
end
