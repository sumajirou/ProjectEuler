# ナイーブな実装
require_relative 'util'
require 'prime'

# 素数です
N = 1_000_000_007

def B(n)
  [*1..n].map{|k| C(n,k)}.prod
end

def D(n)
  sumdivisors(B(n))
end

def S(n)
  [*1..n].map{|k| D(k) % N}.sum
end


n = 100
p B(n)
p D(n)
p S(n)
p S(n) % N