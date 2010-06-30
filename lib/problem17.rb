require File.dirname(__FILE__) + '/problem.rb'
# How many letters would be needed to write all the numbers in words from 1 to 1000?
class Problem17 < Problem
  
  attr_reader :word 
  
  def initialize()
    @word = {
      0 => "",        10 => "ten",        20 => "twenty",
      1 => "one",     11 => "eleven",     30 => "thirty",
      2 => "two",     12 => "twelve",     40 => "forty",
      3 => "three",   13 => "thirteen",   50 => "fifty",
      4 => "four",    14 => "fourteen",   60 => "sixty",
      5 => "five",    15 => "fifteen",    70 => "seventy",
      6 => "six",     16 => "sixteen",    80 => "eighty",
      7 => "seven",   17 => "seventeen",  90 => "ninety",
      8 => "eight",   18 => "eighteen",   100 => "hundred",
      9 => "nine",    19 => "nineteen",   1000 => "onethousand"
      }
    super 
  end

  def translate(n)
    if n >= 100
      if n == 100
        "onehundred"
      else
        hundreds = (n/100) * 100 
        rest = translate(n-hundreds)
        tens_s = !rest.empty? ? "and" + rest : ""
        @word[n] ||= @word[hundreds/100] + @word[100] + tens_s
      end
    else
      return @word[n] if @word[n]
      tens = (n/10) * 10
      @word[n] ||= @word[tens] + @word[n-tens]
    end
  end

  def problem(data=1000) 
    (data.downto(1)).inject(0) {|sum,n| sum + translate(n).size}
  end
end
