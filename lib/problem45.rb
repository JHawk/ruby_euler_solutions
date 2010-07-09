# After 40755, what is the next triangle number that is also pentagonal and hexagonal?
class Problem45 < Problem 
  def initialize ; super end
  
  def triangle(n) (n**2 + n) / 2 end
  
  def pentagonal(n) (3*n**2 - n) / 2 end
  
  def hexagonal(n) (2*n**2 - n) end

  def problem(tri=285,pent=165,hex=143)
    tmp_tri = 0
    tmp_pent = 1
    tmp_hex = 2
    while tmp_tri != tmp_pent || tmp_pent != tmp_hex
      tmp_tri = triangle(tri += 1) if tmp_tri < tmp_pent
      tmp_pent = pentagonal(pent += 1) if tmp_pent < tmp_hex
      tmp_hex = hexagonal(hex += 1) if tmp_hex < tmp_tri
    end
    tmp_tri
  end  
end
