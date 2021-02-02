require 'prime'

# 問題の確認
[3,7,109,673].permutation(2).map{|n,m| (n.to_s+m.to_s).to_i}.all?(&:prime?)

# 例えば4個のペアは3個のペアを内包している
# 3個のペアを計算してから、4個のペアを組み立てるという方針

def check(primes)
    primes.permutation(2) do |n,m|
        unless (n * 10 ** Math.log10(m).ceil + m).prime?
            return false
        end
    end
    return true
end

def check2(n, primes)
    primes.each do |prime|
        return false unless (n * 10 ** Math.log10(prime).ceil + prime).prime?
        return false unless (prime * 10 ** Math.log10(n).ceil + n).prime?
    end
    return true
end

MAX = 10000
# 1000以下で検討
# まず2個で条件を満たすもの
primes_max = Prime.each(MAX).to_a.drop(1)
p primes_max
p primes_max.length

pairprime2 = primes_max.combination(2).filter{|primes| check(primes)}
p pairprime2
p pairprime2.length

pairprime3 = []
pairprime2.map do |pair|
    primes_max.each do |prime|
        next if pair[-1] > prime
        pairprime3 << (pair + [prime]) if check2(prime,pair)
    end
end
p pairprime3
p pairprime3.length

pairprime4 = []
pairprime3.map do |pair|
    primes_max.each do |prime|
        next if pair[-1] > prime
        pairprime4 << (pair + [prime]) if check2(prime,pair)
    end
end
p pairprime4
p pairprime4.length

pairprime5 = []
pairprime4.map do |pair|
    primes_max.each do |prime|
        next if pair[-1] > prime
        pairprime5 << (pair + [prime]) if check2(prime,pair)
    end
end
p pairprime5
p pairprime5.length

# 実行結果
# [13, 5197, 5701, 6733, 8389].sum #=> 26033
# [Done] exited with code=0 in 114.258 seconds




# 時間がかかって終わらねえ
# 3と7はほぼ確実に入ってると思いやせんか？
# prime_1000 = Prime.each(5000).to_a.drop(4) # 2,3,5,7を取り除く
# prime_1000.combination(3) do |primes|
#     if check([3,7] + primes)
#         p [3 + 7 + primes.sum,[3,7] + primes]
#     end 
# end

# それどころか3 7 109 673も確定していたりしてな
# 673以下の素数を取り除く
# Prime.each(1000000).to_a.filter{|n| 673 < n }.each do |prime|
#     if check([3,7,109,673,prime])
#         p [3 + 7 + 109 + 673 + prime,[3,7,109,673,prime]]
#     end 
# end