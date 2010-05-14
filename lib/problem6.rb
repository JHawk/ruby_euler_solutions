# What is the difference between the sum of the squares and the square of the sums?
def problem_6(last = 100)
  sum = 0
  sum_sq = 0
  (1..last).each do |i|
    sum += i
    sum_sq += i * i
  end
  puts "problem_6 => #{(sum *= sum) - sum_sq}"
end
