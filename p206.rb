# n^2 = 1_2_3_4_5_6_7_8_9_0 となる唯一のnを求めよ
num = "1_2_3_4_5_6_7_8_9_0"
# nの1,2桁目は0である
num = "1_2_3_4_5_6_7_8_900"
# 10分の1して、最後に10倍して戻そう
num = "1_2_3_4_5_6_7_8_9"
min = num.tr("_","0").to_i
max = num.tr("_","9").to_i
p min,max

nmin = Math.sqrt(min).ceil
# nの2桁目は3か7
nmin = nmin/10*10+3
nmax = Math.sqrt(max).floor
p nmin,nmax

puts "start!"
nmin.step(nmax,10) do |n|
    m = n**2
    if /1.2.3.4.5.6.7.8.9/ =~ m.to_s
        puts n * 10
    end
    m = (n+4)**2
    if /1.2.3.4.5.6.7.8.9/ =~ m.to_s
        puts (n+4) * 10
    end
end
puts "end."

#=> 1389019170