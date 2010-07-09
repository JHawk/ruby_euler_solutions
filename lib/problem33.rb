# Discover all the fractions with an unorthodox cancelling method.
class Problem33 < Problem 
  def initialize; super end

  def problem 
    curious_fractions = []
    (11..99).each do |n|
      (11..99).each do |d|
        n_arr = n.to_s.chars.to_a
        d_arr = d.to_s.chars.to_a
        if n_arr[1] == d_arr[0] && !n_arr.include?("0") && !d_arr.include?("0")
          q = n.quo(d)
          if q < 1
            curious_fractions << q if q == n_arr[0].to_i.quo(d_arr[1].to_i)
          end
        end
      end
    end
    curious_fractions.inject(1) do |p,q| 
      n,d = q.to_s.split("/")
      p * d.to_i / n.to_i
    end
  end  
end
