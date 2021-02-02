require 'prime'

# 問題の確認
[3,7,109,673].permutation(2).map{|n,m| (n.to_s+m.to_s).to_i}.all?(&:prime?)

def check(primes)
    primes.permutation(2) do |n,m|
        unless (n * 10 ** Math.log10(m).ceil + m).prime?
            return false
        end
    end
    return true
end

26.upto(1000) do |sum|
end

sum = 26
prime_1000 = Prime.each(1000).to_a.drop(1)
prime_1000.combination(3) do |primes|
    if check(primes)
        p [primes.sum,primes]
    end 
end
