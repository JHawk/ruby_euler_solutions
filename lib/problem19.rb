require File.dirname(__FILE__) + '/problem.rb'
require 'time'

# How many Sundays fell on the first of the month during the twentieth century?
class Problem19 < Problem
  
  def initialize 
    @months = [31,[28,29],31,30,31,30,31,31,30,31,30,31]
    super 
  end

  def leap_year?(year) year % 100 == 0 ? year % 400 == 0 : year % 4 == 0 end

  def problem(s_time = Time.mktime(1901,1,1),e_time = Time.mktime(2000,12,31)) 
    wday = s_time.strftime('%w').to_i
    mday = s_time.strftime('%d').to_i
    s = wday == 0 && mday == 1 ? 1 : 0
    (s_time.strftime('%Y').to_i..e_time.strftime('%Y').to_i).inject(s) do |fs_total,year|
      fs_total += @months.inject(0) do |first_sundays,days|
        days = leap_year?(year) ? days[1] : days[0] if days.kind_of? Array
        (wday = (days + wday) % 7) == 0 ? first_sundays += 1 : first_sundays
      end
    end
  end
end
