# 1+2+3+4の括弧の付け方
# 3つの演算子が存在する。どの演算子から先に計算するかで、3!通り存在
# ただし、1,3,2と2,3,1は結果が同じになるため実質5通り
# ((1+2)+3)+4
# (1+(2+3))+4
# 1+((2+3)+4)
# 1+(2+(3+4))
# (1+2)+(3+4)
# 演算子の選び方は4^3=64通り
# 数字の選び方は10P4=10*9*8*7=5040通り
# 0除算したくないので0は除く。多分0は候補に入らんだろ
result = [*1..9].combination(4).map do |a,b,c,d|
  list = [[a,b,c,d].join]
  a = "Rational(#{a})"
  b = "Rational(#{b})"
  c = "Rational(#{c})"
  d = "Rational(#{d})"
  list += ["+","-","*","/"].repeated_permutation(3).flat_map do |op1,op2,op3|
    ["((#{a+op1+b})#{op2+c})#{op3+d}",
     "(#{a+op1}(#{b+op2+c}))#{op3+d}",
     "#{a+op1}((#{b+op2+c})#{op3+d})",
     "#{a+op1}(#{b+op2}(#{c+op3+d}))",
     "(#{a+op1+b})#{op2}(#{c+op3+d})"
    ].map{|expr|
      begin
        eval expr
      rescue ZeroDivisionError
        Rational(-1)
      end
    }.filter{|r| r.denominator == 1 and r > 0}
  end.map(&:to_i).uniq.sort
  list
  # [[a,b,c,d].map(&:to_i),list]
end

p result