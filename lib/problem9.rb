# TODO speed this up
def problem_9
  a = 100
  while a < 500
    b = a + 1
    while b < 500
      c = b + 1
      while c < 500
        if (a + b + c) == 1000 && (a**2 + b**2) == c**2
          return puts "problem_9 => #{a * b * c}"
        end
        c += 1
      end
      b += 1
    end
    a += 1
  end
end
