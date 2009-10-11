#!/usr/bin/ruby

########################## DATA

@data_3 = 600851475143
@data_8 = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
@data_11 = [
  [ 8,  2, 22, 97, 38, 15,  0, 40,  0, 75,  4,  5,  7, 78, 52, 12, 50, 77, 91,  8],
  [49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48,  4, 56, 62,  0],
  [81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30,  3, 49, 13, 36, 65],
  [52, 70, 95, 23,  4, 60, 11, 42, 69, 24, 68, 56,  1, 32, 56, 71, 37,  2, 36, 91],
  [22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80],
  [24, 47, 32, 60, 99,  3, 45,  2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50],
  [32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70],
  [67, 26, 20, 68,  2, 62, 12, 20, 95, 63, 94, 39, 63,  8, 40, 91, 66, 49, 94, 21],
  [24, 55, 58,  5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72],
  [21, 36, 23,  9, 75,  0, 76, 44, 20, 45, 35, 14,  0, 61, 33, 97, 34, 31, 33, 95],
  [78, 17, 53, 28, 22, 75, 31, 67, 15, 94,  3, 80,  4, 62, 16, 14,  9, 53, 56, 92],
  [16, 39,  5, 42, 96, 35, 31, 47, 55, 58, 88, 24,  0, 17, 54, 24, 36, 29, 85, 57],
  [86, 56,  0, 48, 35, 71, 89,  7,  5, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58],
  [19, 80, 81, 68,  5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77,  4, 89, 55, 40],
  [ 4, 52,  8, 83, 97, 35, 99, 16,  7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66],
  [88, 36, 68, 87, 57, 62, 20, 72,  3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69],
  [ 4, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18,  8, 46, 29, 32, 40, 62, 76, 36],
  [20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74,  4, 36, 16],
  [20, 73, 35, 29, 78, 31, 90,  1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57,  5, 54],
  [ 1, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52,  1, 89, 19, 67, 48]]

########################## UTILS

def is_prime?(n)
  2.upto(Math.sqrt(n)) do |i|
    return false if n % i == 0
  end
  return true
end

########################## SOLUTIONS

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

def problem_2(a = 0,b = 1,t = 1,sum = 0)
  while t < 4000000
    sum += t if t % 2 == 0
    a = b
    b = t
    t = a + b
  end
  puts "problem_2 => #{sum}\n"
end

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

def problem_5
  # TODO
end

def problem_6(last = 100)
  sum = 0
  sum_sq = 0
  (1..last).each do |i|
    sum += i
    sum_sq += i * i
  end
  puts "problem_6 => #{(sum *= sum) - sum_sq}"
end

# TODO speed this up
def problem_7(nth = 6,i = 13)
  while nth < 10001
    i += 2
    nth += 1 if is_prime?(i)
  end
  puts "problem_7 => #{i} = prime && nth => #{nth}"
end

def problem_8(start = 99999,p = 1)
  while start > 0
    if @data_8.include?(start.to_s) && !start.to_s.include?("0")
      start.to_s.each_char {|i| p *= i.to_i}
      return puts "problem_8 => #{p}"
    end
    start -= 1
  end
end

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

def problem_10
  # TODO
end

def problem_11(min = 90)
  big_prod = 0
  dirs = [[0,1],[1,0],[1,1],[0,-1],[-1,0],[-1,-1],[-1,1],[1,-1]]
  max_x = @data_11.count
  max_y = @data_11.first.count

  while min >= 50
    @data_11.each_with_index do |row,r|
      row.each_with_index do |val,c|
        dirs.each do |d|
          p = val
          for i in (1..3)
            x = (d.first * i) + r
            y = (d.last * i) + c
            if x < 0 ||
                y < 0 ||
                x >= max_x ||
                y >= max_y 
              next
            end
            p *= @data_11[x][y]
          end
          big_prod = p if p > big_prod
        end
      end
    end
    min -= 10
  end
  puts "problem_11 => #{big_prod}"
end

########################## CALLING SOLUTIONS

problem_1
problem_2
problem_3
problem_4
problem_5
problem_6
problem_7
problem_8
problem_9
problem_10
problem_11
