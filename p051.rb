require 'prime'

def check(str)
    if str[0] == "*"
        start = 1
    else
        start = 0
    end
    return (start..9).map{|n| str.tr("*",n.to_s).to_i}.filter{|n| n.prime?}
end

a = "*123456789".split("")
b = "*0123456789".split("")
c = "1379".split("")

digit = 2
loop do
    x = a.dup
    (digit-2).times do
        x = x.product(b).map(&:join)
    end
    x.select!{|item| item.include?("*")}
    x = x.product(c).map(&:join)
    
    x.each{|s|
        res = check(s)
        if res.length >= 8
            puts "Found."
            p s
            p res
            exit
        end
    }
    puts "Not found in #{digit} digit numbers."
    digit += 1
    break if digit == 7
end