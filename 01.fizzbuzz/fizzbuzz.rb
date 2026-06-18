#!/usr/bin/env ruby

array = (1..20).to_a  # 1から20までの配列を作成する
1.upto(20) do |i| # 配列をループで処理
  result = if (i % 3 == 0 && i % 5 == 0) # 両方の倍率に合致した場合 = 3でも5でも割り切れるときはFizzBuzzを返す
    "FizzBuzz"
  elsif (i % 3 == 0)  # 3の倍数の時 = 3で割り切れるときはFizzを返す
    "Fizz"
  elsif (i % 5 == 0) # 5の倍数の時　= 5で割り切れるときはBuzzを返す
    "Buzz"
  else
    i # それ以外はそのまま返す
  end
  puts result # ifの返り値をプリント
end