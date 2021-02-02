# ピタゴラス数の生成公式がある
# 正の整数 m,n(m>n) を用いて，
# a=m^2−n^2,b=2mn,c=m^2+n^2
# とすると，(a,b,c) はピタゴラス数になります。
# ここでL = a+b+c = 2m^2 + 2mn = 2m(m+n)

# とりあえず原始ピタゴラス数を生成してみよう
# 原始ピタゴラス数のa+b+c=Lを求めればなにかわかるかも
# 原始ピタゴラス数の条件は (m,n) == 1 , m > n, m-n is even



# L = 2m(m+n) > 2m^2
# m^2 < L/2
# m < sqrt(L/2)
limit = 1_500_000
# mlimit = (Math.sqrt(limit)/2).floor #ここで間違えてた
mlimit = (Math.sqrt(limit/2)).floor
p mlimit
pitalens =[]
2.upto(mlimit+1) do |m|
  # mが偶数の時nは奇数、mが奇数の時nは偶数
  # n < m
  (m%2+1).step(m-1,2) do |n|
    # mとnは互いに素
    next if m.gcd(n) != 1
    pitalens.push(2*m*(m+n))
  end
end
p pitalens[-1]
# pitalens.sort.each do |item| p item end
p pitalens.size

list = pitalens.flat_map do |l|
  l.step(limit,l).to_a
end

p list.size
list = list.sort.group_by(&:itself).transform_values(&:size)
p list.filter{|k,v| v == 1}.size
# L = a+b+c は偶数

# 長さが100以下の三角形のうち、
# 12の倍数は 100/12 = 8 => 12,24,36,48,60,72,84,96
# 30の倍数は 100/30 = 3 => 30,60,90
# 40の倍数は 100/40 = 2 => 40,80
# 56の倍数は 100/56 = 1 => 56
# 70の倍数は 100/70 = 1 => 70
# 90の倍数は 100/90 = 1 => 90

