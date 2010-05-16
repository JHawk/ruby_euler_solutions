require File.dirname(__FILE__) + '/problem.rb'
# How many letters would be needed to write all the numbers in words from 1 to 1000?
class Problem17 < Problem
  def initialize; super end

  def problem
=begin
    numbers_letter_count_h = {
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
      1000 => 8, # thousand
      "and" => 3 # dumb!!!!!
    }
    sum = 0
    def accum(n)
      numbers_letter_count_h[n] ||
      
      
      div = 10**(n.to_s.size - 1) 
        numbers_letter_count_h[n] = 
    end

    (1..1000).each do |n|


    end
=end    
  end
end
