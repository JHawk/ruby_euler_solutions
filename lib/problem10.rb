def problem_10(max = 2000000)
  nums = Hash.new(true)
  sum = 0

  even = 4
  while even <= max
    nums[even] = false
    even += 2
  end

  odd = 3
  while odd < max
    x = odd * 2
    while x <= max
      nums[x] = false
      x += odd
    end
    odd += 2 
  end

  for x in (2..max)
    sum = sum + x if nums[x]
  end
  puts "problem_10 => #{sum}"
end
