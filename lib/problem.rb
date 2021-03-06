class Problem
  @@problems = [] 
  
  attr_reader :start
  
  def initialize
    @start = Time.now 
  end
  
  def answer
    puts "calculating #{self.class}..."
    "#{self.class.to_s.ljust(11)}: answer => #{problem.to_s.ljust(15)}: runtime => #{Time.now - self.start}s"
  end
  
  def self.problems; @@problems end
  
  def <=>(o) self.class <=> o.class end
  
  private
  
  # make a list of all problems that inherit from problem superclass
  def self.inherited(klass) @@problems << klass end
end 
