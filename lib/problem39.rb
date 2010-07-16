# If p is the perimeter of a right angle triangle, {a, b, c}, which value, for p ≤ 1000, has the most solutions?
class Problem39 < Problem 
  def initialize ; super end

  # this actually doubles the number of solutions counted bc the number will be 
  # found twice... 
  # But since we want the one with the most and dont care about the exact number
  # WHO CARES?!
  # Could probably also further narrow the search space
  def problem(p=1000)
    max = 0
    perimeter = 3
    (p/2..p).each do |i|
      count = 0
      (1..i/2).each do |c|
        sq = c**2
        (((c-1)/2).floor..c-1).each do |b|
          count += 1 if [Math::sqrt(sq-b**2),b,c].sum == i
        end
      end
      if count > max
        max = count 
        perimeter = i
      end
    end
    perimeter
  end  
end
