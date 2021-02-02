# (1)BigDecimalで精度を確保しつつ計算するやり方
# 遅いし、nが大きくなるとやはり誤差が出る

# 平方根や逆数の計算でどうしても誤差が発生。止まらなくなる
require 'bigdecimal'
require 'bigdecimal/util'

# cf = continued fracrtions
# int = integer part
# dec = decimal part
# cir = circulation part
# rec = reciprocal

def make_cf(n)
    n = n.to_d
    m = n.sqrt(400)
    first_int = m.floor
    first_dec = m - first_int
    if first_dec == 0
        return [first_int,[]]
    end
    m = 1/first_dec
    cir = []
    loop do
        int = m.floor
        cir.push(int)
        dec = m - int
        break if int == first_int*2
        m = 1/dec
    end
    return [first_int,cir]
end

max = 100
count = 0
1.upto(max) do |n|
    cf = make_cf(n)
    puts "#{n} #{cf}"
    if cf[1].size.odd?
        count +=1
    end
end
puts count

