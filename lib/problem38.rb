# What is the largest 1 to 9 pandigital that can be formed by multiplying a fixed number by 1, 2, 3, ... ?
class Problem38 < Problem 
  def initialize; super end

  def build_concat(i)
    c = 1
    p = ""
    while p.size < 9
      p << (i*c).to_s
      c += 1
    end
    p.to_i
  end

  def problem 
    9999.downto(0).each do |i|
      p = build_concat(i)
      return p if p.pandigital?
    end
  end  
end
