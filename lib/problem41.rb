# What is the largest n-digit pandigital prime that exists?

class Problem41 < Problem
  def initialize ; super end

  def problem(a=[9,8,7,6,5,4,3,2,1])
    ps = []
    n = a.first
    a.each_permutation {|x| ps << x}
    a.each_with_index do |n,idx|
      return nil if n <= 1
      ps[0..n.factorial-1].each do |x| 
        t = x[idx..x.size]
        return t if t.to_i.prime? 
      end
    end
  end
end
