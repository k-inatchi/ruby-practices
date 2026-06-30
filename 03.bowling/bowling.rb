#!/usr/bin/env ruby
# frozen_string_literal: true

frames = 10
max_pins = 10

argv_score = ARGV[0]
scores = argv_score.split(',')

shots = []
scores.each do |score|
  shots << (score == 'X' ? max_pins : score.to_i)
end

point = 0
i = 0
1.upto(frames) do
  if shots[i] == max_pins
    point += shots[i] + shots[i + 1] + shots[i + 2]
    i += 1
  elsif shots[i] + shots[i + 1] == max_pins
    point += shots[i] + shots[i + 1] + shots[i + 2]
    i += 2
  else
    point += shots[i] + shots[i + 1]
    i += 2
  end
end

puts point
