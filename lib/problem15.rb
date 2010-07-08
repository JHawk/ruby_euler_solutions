# Starting in the top left corner in a 20 by 20 grid, how many routes are there to the bottom right corner?
class Problem15 < Problem 
  def initialize; super end

  def problem(a=[20,20])
    equiv_orderings_r = a[0].factorial
    equiv_orderings_d = a[0] == a[1] ? equiv_orderings_r : a[1].factorial
    total_moves = a.sum.factorial
    total_moves / (equiv_orderings_r * equiv_orderings_d)
  end
end
