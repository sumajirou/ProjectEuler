# frozen_string_literal: true

# n^2 = 1_2_3_4_5_6_7_8_9_0 となる唯一のnを求めよ
num = '1_2_3_4_5_6_7_8_900'
# nの1,2桁目は0である
num = '1_2_3_4_5_6_7_8_900'
# 10分の1して、最後に10倍して戻そう
num = '1_2_3_4_5_6_7_8_9'
min = num.tr('_', '0').to_i
max = num.tr('_', '9').to_i
p min, max
p Math.sqrt(min).ceil, Math.sqrt(max).floor
min.step(max) do |n|
  # nの2桁目は3か7
  next if (n % 10 == 3) || (n % 10 == 7)

  m = n**2
  puts n
  sleep(1)
  if /1.2.3.4.5.6.7.8.900/ =~ m.to_s
    puts n * 10
  end
end
