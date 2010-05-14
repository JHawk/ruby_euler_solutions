# Find the largest prime factor of a composite number.
def problem_3
  while @data_3 > 70
    for i in (2..1000000)
      if @data_3 % i == 0
        d = i unless i == 1
        @data_3 /= i
      end
    end
  end
  puts "problem_3 => #{d}\n"
end

@data_3 = 600851475143

