# ピタゴラス数の生成公式がある
# 正の整数 m,n(m>n) を用いて，
# a=m^2−n^2,b=2mn,c=m^2+n^2
# とすると，(a,b,c) はピタゴラス数になります。
# ここでL = a+b+c = 2m^2 + 2mn = 2m(m+n)

# とりあえず原始ピタゴラス数を生成してみよう
# 原始ピタゴラス数のa+b+c=Lを求めればなにかわかるかも
# 原始ピタゴラス数の条件は (m,n) == 1 , m > n, m-n is even



# L = 2m(m+n) < 2m(m+m) = 4m^2 = (2m)^2
# sqrt(L) < 2m
# sqrt(L)/2 < m
limit = 120
mlimit = (Math.sqrt(limit)/2).floor
pitas =[]
2.upto(mlimit) do |m|
  mm = m**2  
  # mが偶数の時nは奇数、mが奇数の時nは偶数
  # n < m
  (m%2+1).step(m-1,2) do |n|
    # mとnは互いに素
    next if m.gcd(n) != 1
    nn = n**2
    a = mm - nn
    b = 2*m*n
    c = mm + nn
    pita = [a,b,c]
    pitas.push([pita.sum,pita])
  end
end
pitas.sort.each do |item| p item end
p pitas.size
exit
# L = a+b+c は偶数
limit = 100
12.upto(limit) do |l|
end

# 長さが100以下の三角形のうち、
# 12の倍数は 100/12 = 8 => 12,24,36,48,60,72,84,96
# 30の倍数は 100/30 = 3 => 30,60,90
# 40の倍数は 100/40 = 2 => 40,80
# 56の倍数は 100/56 = 1 => 56
# 70の倍数は 100/70 = 1 => 70
# 90の倍数は 100/90 = 1 => 90

