class Problem
  @@problems = [] 
  
  def answer() "#{self.class} => #{problem}" end
  
  def self.problems; @@problems end
  
  def <=>(o) self.class <=> o.class end
  
  private
  
  # make a list of all problems that inherit from problem superclass
  def self.inherited(klass) @@problems << klass end
end 
