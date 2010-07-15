class Pentagonal
  include Comparable
  attr :index
  
  def initialize(n) @index = n end
  
  def succ ; Pentagonal.new(@index + 1) end
  
  def value ; @value ||= (3*index**2 - index) / 2 end
  
  def <=>(o) @index <=> o.index end
  
  def to_s ; "#{inspect}" end
     
  def inspect ; value end
  
  def +(o) 
    return value + o.value if o.respond_to?(:value)
    value + o 
  end
  
  def -(o) 
    return value - o.value if o.respond_to?(:value)
    value - o
  end
end
   
# After 40755, what is the next triangle number that is also pentagonal and hexagonal?
class Problem44 < Problem 
  def initialize ; super end

  def problem
    pentagonals = []
    pent = Pentagonal.new 1
    pentagonals = [pent] + pentagonals
    while true
      pentagonals.each do |p|
        pent - p 
      end
        return 
        pent = pent.succ

    end
  end  
end
