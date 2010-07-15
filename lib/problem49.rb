require File.dirname(__FILE__) + '/utils.rb'
# Find arithmetic sequences, made of prime terms, whose four digits are permutations of each other.
class Problem49 < Problem 
  def initialize 
    @primes = []
    Utils::euler_sieve(9999) {|p| @primes << p if p > 1000}
    super 
  end

  def problem
    @primes.each do |p| 
      pps = []
      p.to_s.each_permutation {|m| pps << m.to_i if p != m && @primes.include?(m.to_i)}
      pps = pps.uniq.sort
      length = pps.size
      next unless length > 2
      pps.each_with_index do |first,idx|
        break if idx > length - 3
        diff = pps[idx+1]-first
        return pps[idx..idx+2].join if (0..2).all? {|n| pps.include?(first + n * diff)}
      end
    end
  end  
end
