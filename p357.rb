require 'prime'

def check(n)
  1.upto(n) do |d|
    return true if d**2 > n
     next if n % d != 0
    return false unless (d+n/d).prime?
  end
end

limit = 100_000_000
sum = 1
2.step(limit,4) do |n|
  sum += n if check(n)
end
p sum



# nは4で割って2余る数(例外は1)
#=> 1739023853137
# 133.887秒
