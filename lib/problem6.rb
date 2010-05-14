def problem_6(last = 100)
  sum = 0
  sum_sq = 0
  (1..last).each do |i|
    sum += i
    sum_sq += i * i
  end
  puts "problem_6 => #{(sum *= sum) - sum_sq}"
end
