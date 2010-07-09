require File.dirname(__FILE__) + '/utils.rb'

# How many triangle words does the list of common English words contain?
class Problem42 < Problem 
  def initialize
    @data_42 = File.read("#{File.dirname(__FILE__)}/../data/words42.txt").split(",")
    @alpha = [""] + ("A".."Z").to_a
    
    # should start using lazy sequences 
    @tri_nums = Utils::triangle_numbers(@data_42.map(&:size).max * @alpha.size)
    super
  end
  
  def score(word) 
    word.gsub(/"/,"").gsub(/\s/,"").split(//).inject(0) {|s,l| s + @alpha.index(l)} 
  end
  
  def problem(data=@data_42)
    data.inject(0) {|sum,word| sum += @tri_nums.include?(score(word)) ? 1 : 0}
  end
end
