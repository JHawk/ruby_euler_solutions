require 'set'

# Find the sum of all numbers that can be written as pandigital products.
class Problem32 < Problem 
  def initialize; super end
  
  # multiplicand/multiplier/product identity - returning the products
  def mmpi_prods p
    a = p.split(//)   
    prods = [] 
    (1..a.size-6).each do |i|
      (i+1..a.size-5).each do |j|
        prod = a[j+1..a.size-1].join.to_i
        prods << prod if a[0..i].join.to_i * a[i+1..j].join.to_i == prod
      end
    end
    prods
  end
  
  def problem(a = [1,2,3,4,5,6,7,8,9])
    unique_ids = Set.new
    a.each_permutation {|p| unique_ids.merge(mmpi_prods(p))}
    unique_ids.sum
  end
end
