# Add all the natural numbers below one thousand that are multiples of 3 or 5.
class Problem01 < Problem 
  def initialize; super end

  def problem(sum = 0)
    for i in (3..999)
      if i % 3 == 0
        sum += i
      elsif  i % 5 == 0
        sum += i
      end
    end
    sum 
  end
end
