# 数式変形で高速化
require_relative 'util'
require 'prime'


class Hash
  def +(hash)
    self.merge(hash){|k,v1,v2| v1 + v2}
  end

  def -(hash)
    self + hash.map{|k,v| [k,-v]}.to_h
  end

  def *(num)
    self.map{|k,v| [k,v*num]}.to_h
  end

  def /(num)
    self.map{|k,v| [k,v/num]}.to_h
  end
end

# B(n)の漸化式
# B(n) = B(n-1) * n**(n-1) / (n-1)!

# 実際に巨大な数を計算するから遅くなる
# sumdivisorsで必ず素因数分解しなければならない
# 素因数分解したまま計算すればよい
N = 1_000_000_007 # 素数

F = []
F[1] = {}
def Fact(n)
  F[n] ||= Fact(n-1) + n.prime_division.to_h
end


B = []
B[1] = {}
def B(n)
  B[n] ||= B(n-1) + n.prime_division.to_h*n - Fact(n)
end

def sumdivisors(factors)
  return 1 if factors == {}
  # factors.map{|p,e| ((p**(e+1) - 1) / (p - 1)) % N}.prod
  factors.inject(1) do |result,pe|
    p = pe[0]
    e = pe[1]
    if e == 1
      result * p % N
    else
      result * ((p**(e+1) - 1) / (p - 1)) % N
    end
  end
end

def D(n)
  sumdivisors(B(n))
end

def S(n)
  [*1..n].map{|k| p k ;D(k) % N}.sum
end


limit = 20000
1.upto(limit).each do |n|
  B(n)
end
p S(limit) % N
p B[limit]

#=> 460843829
# 3696.365秒 ≒ 1時間 アホか
# しかも間違ってる。オーメーン