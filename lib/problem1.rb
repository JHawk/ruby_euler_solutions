# Add all the natural numbers below one thousand that are multiples of 3 or 5.
def problem_1(sum = 0)
  for i in (3..999)
    if i % 3 == 0
      sum += i
    elsif  i % 5 == 0
      sum += i
    end
  end
  puts "problem_1 => #{sum}\n"
end
