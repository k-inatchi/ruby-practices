#!/usr/bin/env ruby
# frozen_string_literal: true

FRAMES = 10
MAX_PINS = 10

argv_score = ARGV[0]
scores = argv_score.split(',')

shots = scores.map { |score| score == 'X' ? MAX_PINS : score.to_i }

point = 0
shot_index = 0

1.upto(FRAMES) do
  strike = shots[shot_index] == MAX_PINS
  spare = !strike && shots[shot_index, 2].sum == MAX_PINS
  sum_count = strike || spare ? 3 : 2
  shot_count = strike ? 1 : 2

  point += shots[shot_index, sum_count].sum
  shot_index += shot_count
end

puts point
