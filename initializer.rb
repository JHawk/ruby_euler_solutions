Dir[File.dirname(__FILE__) + '/lib/problem*.rb'].each {|file| require file}

# add methods to classes 
class Array
  def each_permutation(idx = nil, str = "", &block)
    idx ||= (0..(self.size - 1)).to_a
    if idx.empty?
      yield str
    else  
      idx.each {|i| each_permutation(idx - [i], str + self[i].to_s, &block)}
    end
  end
end

class Integer
  def even? ; self % 2 == 0 end  
end
