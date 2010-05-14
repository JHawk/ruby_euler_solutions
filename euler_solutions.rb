#!/usr/bin/ruby
Dir[File.dirname(__FILE__) + '/lib/problem*.rb'].each {|file| require file}

if ARGV.empty? 
  Problem.problems.each {|klass| klass.new.answer}
else
  ARGV.each {|nums| puts "not implemented yet"}
end
