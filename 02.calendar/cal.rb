#!/usr/bin/env ruby
require 'date'
require 'optparse'

def display_width(str)
  str.length + str.chars.reject{|c| c.ascii_only?}.length
end

opt = OptionParser.new
params = {}
opt.on('-y YEAR') { |v| params[:year] = v }
opt.on('-m MONTH') { |v| params[:month] = v }
opt.parse!(ARGV)

DAY_WIDTH = 2
WEEK_DAYS = 7

today = Date.today
year = (params[:year] || today.year).to_i
month = (params[:month] || today.month).to_i
first_date = Date.new(year, month, 1)
header = "#{month}月 #{year}"
week = %w(日 月 火 水 木 金 土).join(' ')

puts header.center(display_width(week))
puts week
wday = first_date.wday
print (' ' * DAY_WIDTH + ' ') * wday

first_date.upto(Date.new(year,month,-1)) do |i|
  wday = wday + 1
  print i.day.to_s.rjust(DAY_WIDTH) + ' '
  if wday % WEEK_DAYS == 0
    print "\n"
  end
end


if wday % WEEK_DAYS != 0
  puts
end
