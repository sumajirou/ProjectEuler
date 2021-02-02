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
result = [*1..9].combination(4).map do |nums|
  list = nums.permutation(4).flat_map do |a,b,c,d|
    a = "Rational(#{a})"
    b = "Rational(#{b})"
    c = "Rational(#{c})"
    d = "Rational(#{d})"
    candidate = []
    ["+","-","*","/"].repeated_permutation(3).flat_map do |op1,op2,op3|
      ["((#{a+op1+b})#{op2+c})#{op3+d}",
        "(#{a+op1}(#{b+op2+c}))#{op3+d}",
        "#{a+op1}((#{b+op2+c})#{op3+d})",
        "#{a+op1}(#{b+op2}(#{c+op3+d}))",
        "(#{a+op1+b})#{op2}(#{c+op3+d})"
      ].map{|expr| eval(expr) rescue -1}
      .filter{|r| r > 0 and r.denominator == 1}
    end.map(&:to_i).uniq.sort
  end.uniq.sort
  [nums.join,list]
end

p result

1.step do |n|
  result.filter!{|nums,list| list.include?(n)}
  break if result.size <= 1
end

p result

# [["1258", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 55, 56, 57, 60, 63, 64, 70, 72, 75, 78, 79, 80, 81, 82, 85, 88, 90, 96, 120]]]
# [Done] exited with code=0 in 17.076 seconds
# 1から51まで連続