#!/usr/bin/env ruby
# frozen_string_literal: true

FRAMES = 10
MAX_PINS = 10

argv_score = ARGV[0]
scores = argv_score.split(',')

shots = []
scores.each do |score|
  shots << (score == 'X' ? MAX_PINS : score.to_i)
end

point = 0
shot_index = 0

1.upto(FRAMES) do
  strike = shots[shot_index] == MAX_PINS
  spare = !strike && shots[shot_index] + shots[shot_index + 1] == MAX_PINS
  if strike
    point += shots[shot_index] + shots[shot_index + 1] + shots[shot_index + 2]
    shot_index += 1
  elsif spare
    point += shots[shot_index] + shots[shot_index + 1] + shots[shot_index + 2]
    shot_index += 2
  else
    point += shots[shot_index] + shots[shot_index + 1]
    shot_index += 2
  end
end

puts point
