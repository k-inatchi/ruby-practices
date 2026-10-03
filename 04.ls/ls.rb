#!/usr/bin/env ruby
# frozen_string_literal: true

def ls(target_dir = '.')
  files = Dir.glob('*', base: target_dir).sort_by { |file_name| [file_name.downcase] }
  return if files.empty?

  tab_space = 8
  max_str_length = files.map { |file| str_length(file) }.max
  max_display_width = (max_str_length + 1).ceildiv(tab_space) * tab_space
  display_columns = 3
  display_rows = files.count.ceildiv(display_columns)

  print_file_name(files, display_rows, display_columns, max_display_width)
end

def print_file_name(files, display_rows, display_columns, display_width)
  display_rows.times do |row|
    display_columns.times do |column|
      index = row + (display_rows * column)
      file = files[index]
      next if file.nil?

      space_count = (display_width - str_length(file))
      print file
      print(' ' * space_count) if column < (display_columns - 1)
    end
    puts
  end
end

def str_length(str)
  width = 0
  half_width = /\A[ -~｡-ﾟ]\z/
  str.each_char do |char|
    width += char.match?(half_width) ? 1 : 2
  end
  width
end

ls(ARGV[0])
