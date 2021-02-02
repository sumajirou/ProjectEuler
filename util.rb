require 'prime'

# sumがあるのにprodが無いのはおかしい
class Array
  def prod
    self.inject(:*)
  end
end

def fact(n)
  [*1..n].prod
end

# 組み合わせの数
def C(n,m)
  m = n - m if n < 2*m
  return 1 if n < 0 or m <= 0 or n < m
  (n-m+1..n).zip(1..m).map{|a,b| Rational(a,b)}.prod.to_i
end

# 順列の数
def P(n,m)
  return 1 if n < 0 or m <= 0 or n < m
  [*n-m+1..n].prod
end

# 約数の和
def sumdivisors(n)
  return 1 if n == 1
  pd = n.prime_division
  pd.map{|p,e| ((p**(e+1) - 1) / (p - 1))}.prod
end

def sumdigit(n)
  sum = 0
  while n > 0
    sum += n % 10
    n /= 10
  end
  return sum
end

# 行列を表示する。行の長さは一定である必要あり
def print_matrix(mat)
  margin = mat.transpose.map{|arr| arr.map{|item| item.to_s.size}.max}
  mat.each do |arr|
    arr.each_with_index do |item,i|
      print " %#{margin[i]}d" % item
    end
    puts
  end
  puts
end


# アイデア
# [1,2,3] + 1 #=> [2,3,4]
# 通常は [1,2,3].map(&:succ) とか [1,2,3].map{|n| n+1} と書く

# 桁数もランダムな整数（そうかな）
# (rand(1.0..10)**rand(1.0..10)).floor