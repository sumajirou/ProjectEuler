# (2)BigDecimalで精度を確保しつつ計算するやり方
# 遅いし、nが大きくなるとやはり誤差が出る
# 奇数周期の考察を含む

# 1から100までの平方根の連分数のうち、周期が奇数のものを列挙した。20個ある
# これを見て気づくことはないだろうか
# 2 [1, [2]]
# 5 [2, [4]]
# 10 [3, [6]]
# 13 [3, [1, 1, 1, 1, 6]]
# 17 [4, [8]]
# 26 [5, [10]]
# 29 [5, [2, 1, 1, 2, 10]]
# 37 [6, [12]]
# 41 [6, [2, 2, 12]]
# 50 [7, [14]]
# 53 [7, [3, 1, 1, 3, 14]]
# 58 [7, [1, 1, 1, 1, 1, 1, 14]]
# 61 [7, [1, 4, 3, 1, 2, 2, 1, 3, 4, 1, 14]]
# 65 [8, [16]]
# 73 [8, [1, 1, 5, 5, 1, 1, 16]]
# 74 [8, [1, 1, 1, 1, 16]]
# 82 [9, [18]]
# 85 [9, [4, 1, 1, 4, 18]]
# 89 [9, [2, 3, 3, 2, 18]]
# 97 [9, [1, 5, 1, 1, 1, 1, 1, 1, 5, 1, 18]]
# nが平方数+1のとき周期が1となる
# 更に良く見ると今列挙したnは2つの平方数の和になっている！！！
# しかし4+4=8などは周期は奇数ではないようだ
# (仮説)nの平方根を連分数展開すると周期が奇数になるならばnは2つの平方数の和である

# ちょいと計算してみよう

max = 100
squared = (1..Math.sqrt(max).floor).map{|n| n**2}
1.upto(max) do |n|

end

exit
# 連分数を計算する
# 平方根や逆数の計算でどうしても誤差が発生。止まらなくなる
require 'bigdecimal'
require 'bigdecimal/util'

# cf = continued fracrtions
# int = integer part
# dec = decimal part
# cir = circulation part
# rec = reciprocal


def make_cf(n)
    n = n.to_d
    m = n.sqrt(400)
    first_int = m.floor
    first_dec = m - first_int
    if first_dec == 0
        return [first_int,[]]
    end
    m = 1/first_dec
    cir = []
    loop do
        int = m.floor
        cir.push(int)
        dec = m - int
        break if int == first_int*2
        m = 1/dec
    end
    return [first_int,cir]
end

max = 100
count = 0
1.upto(max) do |n|
    cf = make_cf(n)
    if cf[1].size.odd?
        puts "#{n} #{cf}"
        count +=1
    end
end
puts count

