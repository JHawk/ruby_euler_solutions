# What is the total of all the name scores in the file of first names?
class Problem22 < Problem
  def initialize 
    @score = ("A".."Z").to_a.unshift 0
    @data = File.read("#{File.dirname(__FILE__)}/../data/names22.txt").split(",").sort
    super 
  end
  
  def score(w) w.split(//).inject(0) {|s,l| s += @score.index(l) || 0} end
  
  def problem(data=@data)
    total = 0 
    data.each_with_index {|name,i| total += score(name) * (i+1)}
    total  
  end
end
