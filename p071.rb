limit = 1_000_000

candidate = (3..limit).map do |n|
    # 3/7より小さくなるdの当たりをつける
    d = n * 3 / 7
    until n.gcd(d) == 1
        d -= 1
    end
    Rational(d,n)
end

sorted = candidate.sort
p sorted[-2]
p sorted[-1]
#=> (428570/999997)