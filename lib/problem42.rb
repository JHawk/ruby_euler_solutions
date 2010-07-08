require File.dirname(__FILE__) + '/utils.rb'

# How many triangle words does the list of common English words contain?
class Problem42 < Problem 
  
  def initialize
    @data_42 = File.read("#{File.dirname(__FILE__)}/../data/words42.txt").split(",")
    @triangle_words = {}
    @letters = ("A".."Z").to_a
    
    # should start using lazy sequences 
    @triangle_numbers = Utils::triangle_numbers(@data_42.map(&:size).max)
    super
  end
  
  def score(word) word.inject(0) {|s,l| s + @letters.index(l)} end
  
  def problem(data=@data_42)
    data.inject(0) do |sum,word|
      key = word.gsub(/"/,"").gsub(/\s/,"").split(//).sort
      value = @triangle_words[key]
      if value.nil? 
        (@triangle_words[key] = @triangle_numbers.include?(score(key))) ? sum + 1 : sum
      elsif value
        sum + 1
      else
        sum
      end
    end
  end
end
