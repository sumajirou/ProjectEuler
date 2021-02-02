#立方数 41063625 (3453) は, 桁の順番を入れ替えると2つの立方数になる: 56623104 (3843) と 66430125 (4053) である. 41063625は, 立方数になるような桁の置換をちょうど3つもつ最小の立方数である.

#立方数になるような桁の置換をちょうど5つもつ最小の立方数を求めよ.

result = []
1.step do |digit|
    min = 10 ** (digit - 1)
    max = 10 ** digit - 1
    a = Math.cbrt(min).ceil
    b = Math.cbrt(max).floor
    result = a.upto(b).group_by{|n| (n**3).to_s.chars.sort.join}.values.select{|a| a.length == 5}
    if result.length >= 1
        puts "digit is #{digit}"
        result.each{|item| p item}
        break
    end
end
puts "#{result[0][0]}^3 = #{result[0][0]**3}"

# 5027^3 = 127035954683