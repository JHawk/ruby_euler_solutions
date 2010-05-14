class Problem
  @@problems = [] 
  
  def answer() puts "#{self.class} => #{problem}" end
  
  def self.problems; @@problems end
  
  private
  
  # make a list of all problems that inherit from problem superclass
  def self.inherited(klass) @@problems << klass end
end 
