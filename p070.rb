# frozen_string_literal: true

# 面白いことに, φ(87109)=79180 であり, 87109は79180を置換したものとなっている.
# 1 < n < 107 で φ(n) が n を置換したものになっているもののうち,
# n/φ(n) が最小となる n を求めよ.
require 'prime'

def phi(n)
  a = n.prime_division.map { |item| item[0] }
  a.inject(n) { |result, p| result / p * (p - 1) }
end

def phi2(n)
  n.prime_division.map { |p, e| p**(e - 1) * (p - 1) }.inject(&:*)
end

limit = 1e7

minn = 0
minphidivn = 10
2.upto(limit) do |n|
  phin = phi(n)
  next if n.to_s.chars.sort != phin.to_s.chars.sort

  phidivn = 1.0 * n / phin
  if minphidivn > phidivn
    minphidivn = phidivn
    minn = n
  end
end
puts "n = #{minn}"
puts "phi(n)/n = #{minphidivn}"

#=> 8319823
# 243秒はかかりすぎ
