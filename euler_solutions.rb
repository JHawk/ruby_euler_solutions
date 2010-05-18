#!/usr/bin/ruby
Dir[File.dirname(__FILE__) + '/lib/problem*.rb'].each {|file| require file}

if ARGV.empty? 
  Problem.problems.map {|klass| klass.new.answer}.sort.each {|a| puts a}
elsif ARGV.include? "-threaded"
  threads = Problem.problems.map do |klass| 
    Thread.new {|t| klass.new.answer}
  end
  threads.map {|t| t.value}.sort.each {|a| puts a}
else
  Problem.problems.each do |k|
    p = k.to_s  
    index = p =~ /\d/
    if ARGV.include? p[index..p.size]
      puts k.new.answer
    end
  end
end
