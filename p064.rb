require 'BigDecimal'
require 'BigDecimal/util'

def cf2r(cf)
  cf.reverse.inject{|result,n| n + Rational(1,result)}
end


# 第1要素が整数部分、第2要素から最後の要素までが循環部分
Prec = 1000

def sqrt_cf(n)
  sqrtn = BigDecimal(n).sqrt(Prec)
  cf = []
  first_int = sqrtn.floor
  cf.push(first_int)
  first_dec = sqrtn - first_int
  return cf if first_dec.zero?

  rec = 1/first_dec
  loop do
    #整数部分計算、cfに追加、小数部分計算、比較、ifブレーク、逆数、ループ
    int = rec.floor
    cf.push(int)
    dec = rec - int
    # 初回の小数部分と同じ小数部分が現れたら循環部分の終了
    # return cf if (first_dec - dec).abs < BigDecimal('0.1') ** (Prec/2)
    # 循環部分の終了は整数部分の2倍が現れたとき
    return cf if int >= first_int*2
    rec = 1/dec
  end
end

limit = 10000
count = 0

1.upto(limit).each do |n|
  cf = sqrt_cf(n)
  # puts "#{"% 3d" % n} : #{cf.to_s.sub(',',';')}"
  p n
  count += 1 if cf.size % 2 == 0
end
p count

# だめ……うまく行かない
# やはり連分数から平方根を組み立てるやり方のほうが正確か……