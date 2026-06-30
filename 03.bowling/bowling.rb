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
shot_index = 0
1.upto(frames) do
  if shots[shot_index] == max_pins
    point += shots[shot_index] + shots[shot_index + 1] + shots[shot_index + 2]
    shot_index += 1
  elsif shots[shot_index] + shots[shot_index + 1] == max_pins
    point += shots[shot_index] + shots[shot_index + 1] + shots[shot_index + 2]
    shot_index += 2
  else
    point += shots[shot_index] + shots[shot_index + 1]
    shot_index += 2
  end
end

puts point
