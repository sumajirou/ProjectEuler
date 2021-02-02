def rep2num(digit,base)
    result = 1
    (digit-1).times do
        result = result * base + 1
    end
    result
end

# p rep2num(3,2) #=> 7

# 基数の制限はない
# どんな自然数nも(n-1)進法表記で11になる
# 3桁以上のrepunitを1つでも作れるものが対象
# 桁数を増加させていくか、基数を増加させていくかの2つの方針がある
# 桁数でやってみよう

limit = 1e12-1
list = [1]
# 限界桁数の計算 最小は3
maxdigit = Math.log2(limit).floor
3.upto(maxdigit) do |digit|
    # 基数は2から増加させる
    2.step do |base|
        num = rep2num(digit,base)
        break if num > limit
        list.push(num)
    end
end
p result = list.uniq.sort
p result.sum

# 336108797689259276
# [Done] exited with code=0 in 4.445 seconds