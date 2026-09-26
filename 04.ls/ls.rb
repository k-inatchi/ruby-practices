# `ls(target_dir)`というメソッド作成（target_dirは引数、省略時はカレントディレクトリ）
#  childrenは隠しファイルを含んでしまうのでglobを採用
#     https://docs.ruby-lang.org/ja/3.0/class/Dir.html#S_--5B--5D
# Aからソートをかける
# ターミナルの幅を取得して表示列数を調整
#   IO.console.winsize でターミナルの幅を取得
#     https://docs.ruby-lang.org/ja/latest/library/io=2fconsole.html
#   ファイル名の表示幅は str_length で数える（半角1、全角2）
#   配列の中で一番大きな表示幅を取得
#   その表示幅+8を1列の幅（max_display_width）とする
#   max_display_width - str_lengthして空白の数を算出して、file名の右側に配置する空白数を確定する
#   最大列数以下で、window_width / max_display_widthしてmax_columsを確定する(切り捨て floor)
#     max_display_width > window_width の場合は1とする
# files.cont.ceildiv(max_columns) で行数を確定(切り上げ割り算)
#   https://docs.ruby-lang.org/ja/latest/method/Integer/i/ceildiv.html
# 行の値はそれぞれfilesのx番目、filesのx番目+行数*1,filesのx番目+行数*2となる
# 値名をprint、値が存在しない場合はスキップ
# file名がない場合は空白も入れない

require 'io/console'

def ls(target_dir = '.')
  files = Dir.glob('*', base: target_dir).sort_by { |file_name| [file_name.downcase] }
  return if files.empty?

  tab_space = 8
  max_columns = 3
  window_width = IO.console.winsize[1]
  max_str_length = files.map { |file| str_length(file) }.max
  max_display_width = (max_str_length + 1).ceildiv(tab_space) * tab_space
  display_columns = max_display_width > window_width ? 1 : (window_width / max_display_width).clamp(1, max_columns)
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
