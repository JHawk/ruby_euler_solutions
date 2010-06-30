require File.dirname(__FILE__) + '/problem.rb'

# By analysing a user's login attempts, can you determine the secret numeric passcode?

class Problem79 < Problem
  def initialize 
    @data = File.read("#{File.dirname(__FILE__)}/../data/passcode79.txt").split("\n")
    super 
  end

  # TODO could track the head of the list to avoid searching for a key that 
  # doesn't exist in values at end
  def problem(data=@data)
    linked_list = {}
    data.each do |c| 
      code = c.split(//)
      code.each_with_index do |digit,idx|
        current = linked_list[digit]
        next_digit = code[idx+1]
        if current && current != next_digit
          next_val = linked_list[next_digit]
          while next_val
            if next_val == current  
              linked_list[digit] = next_digit
              break
            end
            next_val = linked_list[next_val]
          end
        else
          linked_list[digit] = next_digit
        end
      end
    end
    vals = linked_list.values
    num_s = ""
    head = linked_list.select {|k,_| !vals.include?(k)}.keys.first
    while head
      num_s << head
      head = linked_list[head]
    end
    num_s
  end
end
