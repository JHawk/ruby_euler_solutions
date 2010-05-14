# TODO speed this up
def problem_7(nth = 6,i = 13)
  while nth < 10001
    i += 2
    nth += 1 if is_prime?(i)
  end
  puts "problem_7 => #{i}"
end
