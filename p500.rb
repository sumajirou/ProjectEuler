require 'prime'
require_relative 'util'
def numdivisors(n)
  return 1 if n == 1
  n.prime_division.map{|p,e| e+1}.prod
end

class Hash
  def +(hash)
    self.merge(hash){|k,v1,v2| v1 + v2}
  end
end


# num = 1
# 1.step(10**5) do |n|
#   if numdivisors(n) == num
#     puts "#{num}:#{n}"
#     puts n.prime_division.map{|p,e| "[#{p},#{e}]"}.join
#     num *= 2
#   end
# end


limit = 500500
primes = Prime.each
prime = primes.next
divisors = {}
1.upto(limit) do |n|
  min = [prime,1]
  minvalue = prime
  pre_e = 0
  divisors.each do |p,e|
    break if pre_e == 1
    next if pre_e == e
    temp = p**(e+1)
    if temp < minvalue
      min = [p,e+1]
      minvalue = temp
    end
    pre_e = e
  end
  prime = primes.next if min[1] == 1
  divisors = divisors + [min].to_h
  # puts "#{n}:#{divisors.map{|p,e| p**e}.prod}"
  # puts divisors
end
p limit
p divisors
p divisors.inject(1){|result,item| result * item[0]**item[1] % 500500507}

# 500500
# {2=>31, 3=>15, 5=>15, 7=>15, 11=>7, 13=>7, 17=>7, 19=>7, 23=>7, 29=>7, 31=>7, 37=>7, 41=>7, 43=>7, 47=>7, 53=>3, 59=>3, 61=>3, 67=>3, 71=>3, 73=>3, 79=>3, 83=>3, 89=>3, 97=>3, 101=>3, 103=>3, 107=>3, ...
# 35407281
# [Done] exited with code=0 in 1819.769 seconds
# 流石に時間かかりすぎィ