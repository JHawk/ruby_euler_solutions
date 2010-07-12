# Find the last ten digits of 11 + 22 + ... + 10001000.
class Problem48 < Problem 
  def initialize ; super end

  def problem(n=1000)
    s = (1..n).inject(0) {|s,i| s + i**i}.to_s
    s[s.size-10..s.size-1]
  end  
end
