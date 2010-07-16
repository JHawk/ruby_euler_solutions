class Pentagonal
  include Comparable
  attr :index
  
  def initialize(n) @index = n end
  
  def succ ; Pentagonal.new(@index + 1) end
  
  def value ; @value ||= (3*index**2 - index) / 2 end
  
  def <=>(o) @index <=> o.index end
  
  def +(o) 
    return value + o.value if o.respond_to?(:value)
    value + o 
  end
  
  def -(o) 
    return value - o.value if o.respond_to?(:value)
    value - o
  end
  
  def self.pentagonal?(p)
    Utils::quadratic(1.5,0.5,p*-1).any? do |i| 
      i == i.to_i && Pentagonal.new(i.abs).value == p
    end
  end
end
   
# Find the smallest pair of pentagonal numbers whose sum and difference is pentagonal.
class Problem44 < Problem 
  def initialize ; super end

  def problem
    pentagonals = []
    pent = Pentagonal.new 1
    loop do
      pentagonals.each do |p|
        if Pentagonal.pentagonal?(pent-p) && Pentagonal.pentagonal?(pent+p)
          return pent-p 
        end
      end
      pentagonals = [pent.value] + pentagonals
      pent = pent.succ
    end
  end  
end
