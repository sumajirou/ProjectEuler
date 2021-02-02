# (3) 整数のみで計算する方法
# 正確で早そう
# しかしあまり理解できていないので却下
require 'bigdecimal'
require 'bigdecimal/util'

# cf = continued fracrtions
# int = integer part
# dec = decimal part
# cir = circulation part
# rec = reciprocal


# an = omega_n.floor
# ln1 = pn*an-ln
# pn1 = (N-ln1**2)/pn
# omegan1 = (omega0+ln1)/pn1

def make_cf(n)
    omega0 = sqrt(n)
    l = 0
    p = 1
    
    loop do
        a = 
    end
end


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
    if cf[1].size.odd?
        puts "#{n} #{cf}"
        count +=1
    end
end
puts count

