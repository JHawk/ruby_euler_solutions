# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits in some order.
class Problem52 < Problem 
  def initialize ; super end

  def problem(n=6)
    ms = (2..n)
    i = 1
    loop do 
      is = i.to_s
      return i if ms.all? {|m| is.anagram?((m*i).to_s)}
      i+=1
    end
  end  
end
