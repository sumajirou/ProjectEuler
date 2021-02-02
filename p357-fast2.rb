require 'prime'

def check(n)
  3.upto(n) do |d|
    return true if d**2 > n
     next if n % d != 0
    return false unless (d+n/d).prime?
  end
  return true
end

limit = 100_000_000
# 1+nをパスするnのリスト
ps = Prime.each(limit).to_a
ns = ps.filter{|p| p%4 == 3}.map{|n| n-1}
# 2+n/2をパスするnのリスト
ns = ns & ps.map{|p| 2*p-4}.filter{|n| n < limit}

sum = 1
ns.each do |n|
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
# 26.226秒
# とりあえずここまででいいか
