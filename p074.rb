# 0..9の階乗を予め計算
F = [1]
1.upto(9) do |n|
  F[n] = n * F[n-1]
end

#nの各桁をバラして配列に
def digits(n)
  return [0] if n == 0
  result = []
  while n > 0
    result.push(n%10)
    n /= 10
  end
  return result.reverse
end

# 各桁の階乗の和のチェイン
# 1,2,169,871,872でループに入ることがわかっている
def factchain(n)
  result = [n]
  a = digits(n).map{|n| F[n]}.sum
  until result.include?(a)
    result.push(a)
    a = digits(a).map{|n| F[n]}.sum
  end
  return result
end

# メモ化して効率化を図ったもの
# チェインの途中でn未満の値が出てきた時、メモを参照する。
FC = []
def factchain2(n)
  return FC[n] if FC[n]
  result = [n]
  a = digits(n).map{|n| F[n]}.sum
  until result.include?(a)
    if a < n
      result += factchain2(a)
      break
    end
    result.push(a)
    a = digits(a).map{|n| F[n]}.sum
  end
  return FC[n] = result
end

# p factchain(145)
# p factchain(169)
# p factchain(871)
# p factchain(872)

# p factchain(69)
# p factchain(78)
# p factchain(540)

limit = 1_000_000
counter = 0
1.upto(limit) do |n|
  # p factchain(n)
  counter += 1 if factchain2(n).size == 60
end
puts counter

# 402
# [Done] exited with code=0 in 37.556 seconds

#factchain2を使った場合
# 402
# [Done] exited with code=0 in 4.739 seconds
