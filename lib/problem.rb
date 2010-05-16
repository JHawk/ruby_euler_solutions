class Problem
  @@problems = [] 
  
  def answer
    start = Time.now
    c = self.class.to_s.ljust(11) 
    a = "answer => #{problem.to_s}"
    rt = "runtime => #{Time.now - start}s ".ljust(22)
    "#{c}: #{rt}: #{a}"
  end
  
  def self.problems; @@problems end
  
  def <=>(o) self.class <=> o.class end
  
  private
  
  # make a list of all problems that inherit from problem superclass
  def self.inherited(klass) @@problems << klass end
end 
