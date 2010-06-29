require File.dirname(__FILE__) + '/problem.rb'

# By analysing a user's login attempts, can you determine the secret numeric passcode?

class Problem79 < Problem
  def initialize 
    @data = File.read("#{File.dirname(__FILE__)}/../data/passcode79.txt").split("\n").sort
    super 
  end

  def problem(data=@data)
    data.each {|a| puts a}
  end
end
