include Math
require 'prime'

def M(p,q,n)
  # pとqは必ず1つずつ含む
  pq = p*q
  return 0 if n < pq
  m = n / pq
  # pとqを0個以上使ってmに近づける
  a = 1
  list = []
  while a <= m
    b = log(1.0*m/a,q).floor
    list.push(a*q**b)
    a *= p
  end
  pq * list.max
end

N = 10_000_000

result = 0
# Prime.each(N/2).to_a.combination(2).each do |p,q|
Prime.each(sqrt(N)) do |p|
  Prime.each(N/p) do |q|
    next if p >= q
    result += M(p,q,N)
  end
end
p result
exit
p M(2,3,100) #=> 96
p M(3,5,100)
p M(2,73,100)

# 11109800204052
# [Done] exited with code=0 in 1.428 seconds