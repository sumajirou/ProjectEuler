# (0)素直に連分数を計算するやり方
# 誤差がすごい
# cf = continued fracrtions
# int = integer part
# dec = decimal part
# cir = circulation part
# rec = reciprocal

def nearly_eq(n,m,eps = 1e-3)
    (n-m).abs <= eps
end

def make_cf(n)
    m = Math.sqrt(n)
    first_int = m.floor
    first_dec = m - first_int
    if first_dec == 0
        return [n,[]]
    end
    m = 1/first_dec
    cir = []
    loop do
        int = m.floor
        cir.push(int)
        dec = m - int
        break if nearly_eq(first_dec, dec)
        m = 1/dec
    end
    return [first_int,cir]
end

max = 90
count = 0
list = []
1.upto(max) do |n|
    cf = make_cf(n)
    if cf[1].size.odd?
        puts "#{n} #{cf}"
        list << [n,cf]
        count +=1
    end
end
puts count
list.each do|n,cf|
    puts "#{n} #{cf}"
    # puts "#{cf[1].size} : #{n - cf[0]**2} = #{n} - #{cf[0]}^2"
    # puts "#{n} - #{cf[0]}^2 = #{n - cf[0]**2} -> #{cf[1].size}"
end
