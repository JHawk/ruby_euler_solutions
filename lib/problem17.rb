require File.dirname(__FILE__) + '/problem.rb'
# How many letters would be needed to write all the numbers in words from 1 to 1000?
class Problem17 < Problem
  
  attr_accessor :counts 
  
  def initialize()
    @counts = {
      0 => 0, 
      1 => 3,    # one
      2 => 3,    # two
      3 => 5,    # three
      4 => 4,    # four
      5 => 4,    # five
      6 => 3,    # six
      7 => 5,    # seven
      8 => 5,    # eight
      9 => 4,    # nine

      10 => 3,   # ten
      11 => 6,   # eleven
      12 => 6,   # twelve
      13 => 8,   # thirteen
      14 => 8,   # fourteen
      15 => 7,   # fifteen
      16 => 7,   # sixteen
      17 => 9,   # seventeen
      18 => 8,   # eighteen
      19 => 8,   # nineteen

      20 => 6,   # twenty
      30 => 6,   # thirty
      40 => 5,   # forty
      50 => 5,   # fifty
      60 => 5,   # sixty
      70 => 7,   # seventy
      80 => 6,   # eighty
      90 => 6,   # ninety
      100 => 7,  # hundred 
      1000 => 11,# one thousand
      "and" => 3 # dumb!!!!!
    }
    super 
  end

  def translate(n)
    return @counts[n] if @counts[n]
    if n >= 100
      hundreds = (n/100) * 100 
      @counts[n] = @counts[hundreds/100] + @counts[100] + @counts["and"] + translate(n-hundreds)
    else
      tens = (n/10) * 10
      @counts[n] = @counts[tens] + @counts[n-tens]
    end
  end

  # TODO figure out what tiny edge case is making this wrong
  def problem(data=1000)
    (1.upto(data)).inject(0) {|sum,n| sum + translate(n)}
  end
end
