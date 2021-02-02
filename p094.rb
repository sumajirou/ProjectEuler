
# ペル方程式に帰着させる
# 周の長さをa,a,bとおく。b=a±1
# ヘロンの公式より area = b*√((4aa-bb)/16)
# bが偶数とわかるので2nとおく。a=2n±1
# area = n*√(3nn±4n+1) = nk とおく
# kk = 3nn±4n+1
# 3kk = 9nn ±12 + 3 = (3n ± 2)^2 - 1 = mm - 1 とおく
# mm - 3kk = 1
# このペル方程式の最小解は(m,k)=(2,1)
# 漸化式は (m + k√3)(2+√3)
# = (2m+3k) + (2m + kb)√3
# mが3n+2のとき、周長は2m-2
# mが3n-2のとき、周長は2m+2
# おk

N = 1_000_000_000
list = []
m,k = 2,1
loop do
  m,k = 2*m+3*k, m+2*k
  if m % 3 == 2
    circum = 2*m-2
  elsif m % 3 == 1
    circum = 2*m+2
  end
  break if circum > N
  list.push(circum)
end

p list
p list.sum