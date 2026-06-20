require "date"

today = Date.today
year = today.year
month = today.strftime("%B")
firstday = Date.new(today.year, today.month, 1).day
lastday = Date.new(today.year, today.month, -1).day
firstday_wday = Date.new(today.year, today.month, 1).wday
header = "     #{month} #{year}"
week = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]

puts header
puts week.join(" ")
wday = firstday_wday
print "   " * wday
firstday.upto(lastday) do |i|
  wday = wday + 1
  print i.to_s.rjust(2) + " "
  if wday % 7 == 0
    print "\n"
  end
end
puts
