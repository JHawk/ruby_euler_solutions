# Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed four million.
def problem_2(a = 0,b = 1,t = 1,sum = 0)
  while t < 4000000
    sum += t if t % 2 == 0
    a = b
    b = t
    t = a + b
  end
  puts "problem_2 => #{sum}\n"
end

