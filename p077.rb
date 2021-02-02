#今度は素数:
#2
2
#3
3
#4
2+2
#5
5
3+2
#6
3+3
2+2+2
#7
7
5+2
3+2+2
#8
5+3
3+3+2
2+2+2+2
#9
7+2
5+2+2
3+3+3
3+2+2+2
#10
7+3
5+5
5+3+2
3+3+2+2
2+2+2+2+2
[1,1,1,2,2,3,3,4,5]
#nのときn以下の素数を考える
#10 -> 7,5,3,2
# part(7) = part(7-7,7) + part(7-5,5) + part(7-3,3) + part(7-2,2)
# part(10) = part(10-7,7) + part(10-5,5) + part(10-3,3) + part(10-2,2)
# part(10,10) = part(10-7,7) + part(10-5,5) + part(10-3,3) + part(10-2,2)
# part(10,10) = part(3,7) + part(5,5) + part(7,3) + part(8,2)
# # part(n) は合計がnになる素数の組み合わせの数
# # part(n,m) は合計がnになるm以下の素数の組み合わせの数
# part(7,3) # primes = [2,3]

require 'prime'

$memo = [[],[],[]]
$memo[2][2] = 1

def part(n,m)
  return 1 if n == 0
  return 0 if n == 1
  # puts "part(#{n},#{m})"
  if n < m
    m = Prime.each(n).to_a[-1]
  end
  $memo[n][m] ||= Prime.each(m).map{|prime| part(n-prime,prime)}.sum
end

def print_memo()
  $memo.each_with_index do |ary,n|
    next if ary == []
    ary.each_with_index do |count,m|
      print "part(#{n},#{m}) = #{count} " if count
    end
    puts
  end
end

limit = 100
3.upto(limit) do |n|
  puts "n=#{n}"
  $memo[n] = []
  Prime.each(n) do |m|
    part(n,m)
  end
  # print_memo()
  if $memo[n][-1] >= 5000
    puts "count = #{$memo[n][-1]}"
    break
  end
end

#=> n=71 count = 5007