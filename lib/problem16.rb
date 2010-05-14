# What is the sum of the digits of the number 21000?
def problem_16
  a = 2**1000
  a = a.to_s.split(//)
  puts "problem_16 => #{a.inject(0) {|sum,n| sum + n.to_i}}"
end
