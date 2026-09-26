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
# 次の列の値がない場合は空白を入れない
