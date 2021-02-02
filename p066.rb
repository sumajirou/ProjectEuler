
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
list = []
1.upto(max) do |n|
  next if n == Math.sqrt(n).floor**2
  cf = make_cf(n)
  cf.pop
  r = cf2r(cf)
  x = r.numerator
  y = r.denominator
  if cf.size.odd?
    x,y = x**2+n*y**2, 2*x*y
  end
  puts "#{x}^2 - #{n}*#{y}^2 = 1"
  list.push([x,n])
end
x,n = list.max
puts "n = #{n}, x = #{x} is max"

# n = 661, x = 16421658242965910275055840472270471049 is max
# [Done] exited with code=0 in 1.424 seconds