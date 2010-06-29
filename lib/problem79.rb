require File.dirname(__FILE__) + '/problem.rb'

# By analysing a user's login attempts, can you determine the secret numeric passcode?

class Problem79 < Problem
  def initialize 
    @data = File.read("#{File.dirname(__FILE__)}/../data/passcode79.txt").split("\n").sort
    super 
  end

  def problem(data=@data)
  puts data
  
    t = {}
    data.map.each do |c| 
      tmp = {c[1] => [[c[0]],[c[2]]]}
      t.merge!(tmp) do |k,ov,nv| 
      
      puts k
      puts ov
      puts nv
      
        [ov.first + nv.first,
         ov.last + nv.last]
      end
    end
    t
  end
end
