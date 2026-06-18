#!/usr/bin/env ruby

1.upto(20) do |i|
  result =
    if (i % 3 == 0 && i % 5 == 0)
      'FizzBuzz'
    elsif (i % 3 == 0)
      'Fizz'
    elsif (i % 5 == 0)
      'Buzz'
    else
      i
    end
  puts result
end
