# Finding the nth digit of the fractional part of the irrational number.
class Problem40 < Problem 
  def initialize; super end

  def problem
    i = 0
    count = 0
    tmp = 1
    # d_(1) × d_(10) × d_(100) × d_(1000) × d_(10000) × d_(100000) × d_(1000000)
    [1,10,100,1000,10000,100000,1000000].inject(1) do |p,idx|
      while count < idx
        (i += 1).to_s.split(//).each {|d| tmp = d.to_i if idx == count += 1}
      end 
      p * tmp
    end
  end  
end
