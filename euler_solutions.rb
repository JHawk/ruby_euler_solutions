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
  ARGV.each {|nums| puts "not implemented yet"}
end
