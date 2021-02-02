require 'prime'

def check(n)
  2.upto(n) do |d|
    return true if d**2 > n
     next if n % d != 0
    return false unless (d+n/d).prime?
  end
end

limit = 100_000_000
sum = 1
Prime.each(limit) do |p|
  next unless p % 4 == 3
  n = p-1
  sum += n if check(n)
end
p sum
exit
# n=1で成り立つ
# n>1のとき
# 一番外側同士の和は 1+n であるためnは偶数。 n=2m と置ける
# 二番目同士の和は 2+n/2 = 2+m であるためmは奇数。m=2l+1, n =4l+2 nは4で割って2余る数
# 一番外側の和は 1+n = 4l+3 これが素数である必要があるため、nは4n+3型の素数(夏素数)
# n=夏素数-1

#=> 1739023853137
# 36.826秒
