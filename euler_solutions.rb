#!/usr/bin/ruby

require File.dirname(__FILE__) + '/initializer.rb'

if ARGV.empty? 
  Problem.problems.map {|klass| klass.new.answer}.sort.each {|a| puts a}
elsif ARGV.include? "-threaded"
  threads = Problem.problems.map do |klass| 
    Thread.new {|t| klass.new.answer}
  end
  threads.map {|t| t.value}.sort.each {|a| puts a}
else
  args = ARGV
  ARGV.each {|a| args << "0#{a}" if a.size < 2}
  answers = []
  Problem.problems.each do |k|
    p = k.to_s  
    index = p =~ /\d/
    num = p[index..p.size]
    answers << k.new.answer if ARGV.include? num
  end
  unless answers.empty?
    answers.sort.each {|a| puts a}
  else
    puts "Sorry. No problems seem to match any of these numbers -> #{ARGV.join(", ")}."
  end
end
