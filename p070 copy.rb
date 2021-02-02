# 面白いことに, φ(87109)=79180 であり, 87109は79180を置換したものとなっている.
# 1 < n < 107 で φ(n) が n を置換したものになっているもののうち,
# n/φ(n) が最小となる n を求めよ.
require 'prime'

limit = 1e7

minn = 0
minphidivn = 10
2.upto(limit) do |n|
    pd = n.prime_division
    next unless pd[1]
    phin = pd.inject(n){|result,pe| result / pe[0] * (pe[0]-1)}
    next if n.to_s.bytes.sort != phin.to_s.bytes.sort
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