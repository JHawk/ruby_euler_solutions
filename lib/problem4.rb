def problem_4(start = 999)
  while start > 0
    i = start - 1
    while i > (start - 100)
      p = start * i
      return puts "problem_4 => #{p}" if p.to_s == p.to_s.reverse
      i -= 1
    end
    start -= 1
  end
end
