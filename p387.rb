require 'prime'
def sumdigit(n)
  sum = 0
  while n > 0
    sum += n % 10
    n /= 10
  end
  return sum
end

# 1桁の強いハーシャッド数から2桁の強いハーシャッド数を組み立てる
# これを繰り返し、14桁まで作り、和をとる


# 1桁の強いハーシャッド数
list = [(1..9).to_a]
limit = 14
#10^limit未満の右切り詰め可能ハーシャッド数
(limit-1).times do
  list << list[-1].flat_map do |n|
    (0..9).each_with_object([]) do |m,result|
      num = 10*n+m
      result << num if num % sumdigit(num) == 0
    end
  end
end
list.each do |arr| p arr end
list = list.flatten
p list.length
puts
#強いハーシャッド数かつ右切り詰め可能ハーシャッド数を満たす数
list = list.filter{|n| (n / sumdigit(n)).prime?}
p list
p list.length
puts

# 強い右切り詰め可能ハーシャッド素数
list = list.flat_map do |n|
  [1,3,7,9].each_with_object([]) do |m,result|
    num = 10*n+m
    result << num if num.prime?
  end
end.filter{|n| n < 10**limit}

p list
p list.length
p list.sum

#=> 696067597313468
# 8.571秒