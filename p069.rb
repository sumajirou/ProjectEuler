require 'prime'

def phi(n)
    n.prime_division.map {|p,e| p**(e-1)*(p-1)}.inject(&:*)
end

def phi2(n)
    return (1..n-1).to_a.filter{|m| n.gcd(m) == 1}.length
end

limit = 1_000_000

maxn = 0
maxphidivn = 0
2.upto(limit) do |n|
    phidivn = 1.0 * n /phi(n)
    if maxphidivn < phidivn
        maxphidivn = phidivn
        maxn = n
    end
end
puts "n = #{maxn}"
puts "phi(n)/n = #{maxphidivn}"