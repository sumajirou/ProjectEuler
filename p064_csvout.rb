# (4)計算で√nとの差を減らしながら連分数を構築するやり方

# cf = continued fracrtions
# int = integer part
# dec = decimal part
# cir = circulation part
# rec = reciprocal

def cf2r(cf)
    return cf.reverse.inject{|result,a| Rational(1,result) + a}
end

def make_cf(n)
  m = Math.sqrt(n)
  first_int = m.floor
  cf = [first_int]
  return cf if first_int - m == 0
  while cf[-1] != 2 * first_int
    cf[-1] += 1
    m = cf2r(cf)**2
    len = cf.size
    # 次の項行っていいですか？
    # 近似した連分数配列の長さが偶数の時、mはnより大きい
    # 近似した連分数配列の長さが奇数の時、mはnより小さい
    if (len.even? and m <= n) or (len.odd? and n <= m)
      cf[-1] -= 1
      cf.push(1)
      next
    end
  end
  return cf
end

max = 1000
1.upto(max) do |n|
  cf = make_cf(n)
  print "#{n}"
  cf.each do |k|
    print ",#{k}"
  end
  puts
end

#=> 1322
# 58秒 うまく行った！
