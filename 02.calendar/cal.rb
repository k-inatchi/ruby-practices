#!/usr/bin/env ruby
require "date"
require "optparse"

opt = OptionParser.new
params = {}
opt.on('--year YEAR') {|v| params[:year] = v}
opt.on('--month MONTH') {|v| params[:month] = v}
opt.parse!(ARGV)

today = Date.today
year = (params[:year] || today.year).to_i
month = (params[:month] || today.month).to_i
first_date = Date.new(year, month, 1)
header = "#{first_date.strftime("%B")} #{year}"
week = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"].join(" ")

puts header.center(week.length)
puts week
wday = first_date.wday
print "   " * wday
1.upto(Date.new(year, month, -1).day) do |i|
  wday = wday + 1
  print i.to_s.rjust(2) + " "
  if wday % 7 == 0
    print "\n"
  end
end
puts
